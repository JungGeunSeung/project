package daeho.production.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import daeho.production.dto.ProductionPlanDTO;
import daeho.production.dao.LoggableStatement;

public class ProductionPlanDAO {
	// DataSource 객체를 얻기 위한 메소드 (커넥션 풀을 사용하여 DB 연결 관리)
    private DataSource getDataSource() throws Exception {
        Context ctx = new InitialContext(); // JNDI를 통해 컨텍스트를 초기화
        return (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle"); // 리소스 이름으로 데이터소스 찾기
    }

    // CREATE: 새로운 생산 계획을 DB에 삽입하는 메소드
    public void insertPlan(ProductionPlanDTO plan) throws SQLException {
        // SQL 쿼리: 새로운 plan 레코드를 삽입
        String query = "INSERT INTO plan (planid, production_id, plannedQuan, startDate, EndDate, status, userid) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = getDataSource().getConnection(); // DataSource에서 DB 연결 획득
             PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
            ps.setString(1, plan.getPlanid()); // 첫 번째 매개변수는 planid
            ps.setString(2, plan.getProduction_id()); // 두 번째는 production_id
            ps.setInt(3, plan.getPlannedQuan()); // 세 번째는 계획된 수량
            ps.setDate(4, plan.getStartDate()); // 네 번째는 시작일
            ps.setDate(5, plan.getEndDate()); // 다섯 번째는 종료일
            ps.setString(6, plan.getStatus()); // 여섯 번째는 상태
            ps.setString(7, plan.getUserid()); // 일곱 번째는 사원 ID
            ps.executeUpdate(); // 쿼리 실행하여 DB에 삽입
            System.out.println("새로운 생산계획 db에 삽입!");
        }catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
    }

    // READ: 생산 계획을 페이지별로 조회하는 메소드 (start와 end 범위로 제한)
    public List selectPlan(int start, int end) {
		List list = new ArrayList();

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = dataSource.getConnection();

			String query = " select * ";
			query += " from ( ";
			query += "    select rownum rnum, planid, production_id, plannedQuan, startDate,endDate,  status, userid";
			query += "    from ( ";
			query += "        select  planid, production_id, plannedQuan, startDate,endDate,  status, userid";
			query += "        from plan ";
//		query += "        order by  status";
			query += "    ) ";
			query += " ) ";
			query += " where rnum >= ? and rnum <= ?";

			PreparedStatement ps = new LoggableStatement(con, query);

			ps.setInt(1, start);
			ps.setInt(2, end);

//			System.out.println(((LoggableStatement) ps).getQueryString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductionPlanDTO planDTO = new ProductionPlanDTO();

				planDTO.setPlanid(rs.getString("planid"));
				planDTO.setProduction_id(rs.getString("production_id"));

				int plannedQuan = rs.getInt("plannedQuan");
				planDTO.setPlannedQuan(plannedQuan);

				planDTO.setStartDate(rs.getDate("startDate"));
				planDTO.setEndDate(rs.getDate("endDate"));
				planDTO.setStatus(rs.getString("status"));
				planDTO.setUserid(rs.getString("userid"));
				
				planDTO.setRnum(rs.getInt("rnum"));

				list.add(planDTO);
			}
			rs.close();
			ps.close();
			con.close();
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
        
        return list; // 결과 리스트 반환
    }

    // READ: 특정 planid로 생산 계획을 조회하는 메소드
    public ProductionPlanDTO selectPlanById(String planid) throws SQLException {
        ProductionPlanDTO planDTO = null; // 조회 결과를 담을 PlanDTO 객체
        String query = "SELECT * FROM plan WHERE planid = ?"; // planid로 조회하는 SQL 쿼리
        
        try (Connection con = getDataSource().getConnection(); // DB 연결 획득
             PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
            ps.setString(1, planid); // planid 설정

            ResultSet rs = ps.executeQuery(); // 쿼리 실행 후 결과를 ResultSet으로 받음
            if (rs.next()) { // 결과가 있으면 PlanDTO 객체 생성 및 값 설정
                planDTO = new ProductionPlanDTO();
                planDTO.setPlanid(rs.getString("planid"));
                planDTO.setProduction_id(rs.getString("production_id"));
                planDTO.setPlannedQuan(rs.getInt("plannedQuan"));
                planDTO.setStartDate(rs.getDate("startDate"));
                planDTO.setEndDate(rs.getDate("EndDate"));
                planDTO.setStatus(rs.getString("status"));
                planDTO.setUserid(rs.getString("userid"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
        
        return planDTO; // 조회된 PlanDTO 반환
    }

    // UPDATE: 기존의 생산 계획을 수정하는 메소드
    public void updatePlan(ProductionPlanDTO plan) throws SQLException {
        // SQL 쿼리: planid에 해당하는 레코드를 업데이트
        String query = "UPDATE plan SET production_id = ?, plannedQuan = ?, startDate = ?, EndDate = ?, status = ?, userid = ? WHERE planid = ?";
        
        try (Connection con = getDataSource().getConnection(); // DB 연결 획득
             PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
            ps.setString(1, plan.getProduction_id()); // 생산 ID 업데이트
            ps.setInt(2, plan.getPlannedQuan()); // 계획 수량 업데이트
            ps.setDate(3, plan.getStartDate()); // 시작일 업데이트
            ps.setDate(4, plan.getEndDate()); // 종료일 업데이트
            ps.setString(5, plan.getStatus()); // 상태 업데이트
            ps.setString(6, plan.getUserid()); // 사원 ID 업데이트
            ps.setString(7, plan.getPlanid()); // 수정할 planid 설정
            ps.executeUpdate(); // 쿼리 실행
        }catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
    }

    // DELETE: 특정 planid로 생산 계획을 삭제하는 메소드
    public void deletePlan(String planid) throws SQLException {
        // SQL 쿼리: planid에 해당하는 레코드를 삭제
        String query = "DELETE FROM plan WHERE planid = ?";
        System.out.println("생산계획목록 삭제 메서드 실행");
        try (Connection con = getDataSource().getConnection(); // DB 연결 획득
             PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
            ps.setString(1, planid); // 삭제할 planid 설정
            
            ps.executeUpdate(); // 쿼리 실행
        }catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
    }

    // TOTAL COUNT: plan 테이블의 전체 레코드 수를 반환하는 메소드
    public int totalCount() {
        int result = -1; // 결과를 저장할 변수 (초기값 -1)
        String query = "SELECT count(*) cnt FROM plan"; // 레코드 수를 세는 SQL 쿼리
        
        try (Connection con = getDataSource().getConnection(); // DB 연결 획득
             PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
            ResultSet rs = ps.executeQuery(); // 쿼리 실행 후 결과를 ResultSet으로 받음
            if (rs.next()) { // 결과가 있으면 레코드 수를 변수에 저장
                result = rs.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 발생 시 오류 출력
        }
        
        return result; // 총 레코드 수 반환
    }


}