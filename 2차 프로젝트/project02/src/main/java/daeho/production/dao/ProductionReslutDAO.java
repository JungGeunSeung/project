package daeho.production.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import daeho.production.dto.ProductionResultDTO;

public class ProductionReslutDAO {
	private Connection conn;

    // DAO의 생성자에서 데이터베이스 연결 초기화
    public ProductionReslutDAO(Connection conn) {
        this.conn = conn;
    }
    
    // 데이터 소스를 얻기 위한 메서드
    private DataSource getDataSource() throws Exception {
        Context ctx = new InitialContext(); // JNDI를 통해 컨텍스트를 초기화
        return (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle"); // 리소스 이름으로 데이터소스 찾기
    }



    // 모든 ProductionResult 데이터를 조회하는 메서드
    public List<ProductionResultDTO> getAllResults() throws SQLException {
        List<ProductionResultDTO> resultList = new ArrayList<>();
        String query = "SELECT * FROM ProductionResult";

        // PreparedStatement를 사용하여 SQL 인젝션 방지
        try (PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            // 결과 집합을 반복하며 DTO에 담아 리스트로 반환
            while (rs.next()) {
                ProductionResultDTO result = new ProductionResultDTO(
                    rs.getString("ResultID"),
                    rs.getString("production_id"),
                    rs.getString("taskid"),
                    rs.getString("planid"),
                    rs.getString("ProductionDate"),
                    rs.getInt("ProducedQuantity"),
                    rs.getInt("DefectiveQuantity"),
                    rs.getString("Status")
                );
                resultList.add(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultList;
    }

    // 단일 ProductionResult 데이터를 조회하는 메서드 (Read)
    public ProductionResultDTO getResultById(String resultID) throws SQLException {
        String query = "SELECT * FROM ProductionResult WHERE ResultID = ?";
        ProductionResultDTO result = null;

        try (
        		PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, resultID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    result = new ProductionResultDTO(
                        rs.getString("ResultID"),
                        rs.getString("production_id"),
                        rs.getString("taskid"),
                        rs.getString("planid"),
                        rs.getString("ProductionDate"),
                        rs.getInt("ProducedQuantity"),
                        rs.getInt("DefectiveQuantity"),
                        rs.getString("Status")
                    );
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    // 새로운 ProductionResult 데이터를 삽입하는 메서드 (Create)
    public void insertResult(ProductionResultDTO result) throws SQLException {
        String query = "INSERT INTO ProductionResult (ResultID, production_id, taskid, planid, ProductionDate, ProducedQuantity, DefectiveQuantity, Status) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {

            // ResultID가 NULL인지 확인하고, 로그 출력
        	if (result.getResultID() == null || result.getResultID().isEmpty()) {
                result.setResultID(UUID.randomUUID().toString()); // UUID를 사용하여 고유 ID 생성
            }

            // PreparedStatement에 값 설정
            pstmt.setString(1, result.getResultID());
            pstmt.setString(2, result.getProductionID());
            pstmt.setString(3, result.getTaskID());
            pstmt.setString(4, result.getPlanID());

            // 날짜 형식 처리 (필요 시)
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(result.getProductionDate());
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            pstmt.setDate(5, sqlDate);

            pstmt.setInt(6, result.getProducedQuantity());
            pstmt.setInt(7, result.getDefectiveQuantity());
            pstmt.setString(8, result.getStatus());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // 기존 ProductionResult 데이터를 업데이트하는 메서드 (Update)
    public void updateResult(ProductionResultDTO result) throws SQLException {
        String query = "UPDATE ProductionResult SET production_id = ?, taskid = ?, planid = ?, ProductionDate = ?, ProducedQuantity = ?, DefectiveQuantity = ?, Status = ? " +
                       "WHERE ResultID = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, result.getProductionID());
            pstmt.setString(2, result.getTaskID());
            pstmt.setString(3, result.getPlanID());
            pstmt.setString(4, result.getProductionDate());
            pstmt.setInt(5, result.getProducedQuantity());
            pstmt.setInt(6, result.getDefectiveQuantity());
            pstmt.setString(7, result.getStatus());
            pstmt.setString(8, result.getResultID());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 특정 ProductionResult 데이터를 삭제하는 메서드 (Delete)
    public void deleteResult(String resultID) throws SQLException {
        String query = "DELETE FROM ProductionResult WHERE ResultID = ?";
        System.out.println("생산실적 삭제 메서드 실행");

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, resultID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    public List<ProductionResultDTO> getMonthlyProduction() {
        List<ProductionResultDTO> list = new ArrayList<>();
        String query = "SELECT TO_CHAR(productionDate, 'MM') AS month, SUM(ProducedQuantity) AS totalQuantity " +
                       "FROM ProductionResult GROUP BY TO_CHAR(productionDate, 'MM') ORDER BY month";

        try (Connection con = getDataSource().getConnection(); 
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                ProductionResultDTO result = new ProductionResultDTO();
                result.setMonth(rs.getString("month"));
                result.setProducedQuantity(rs.getInt("totalQuantity"));
                list.add(result);
                
                // 디버깅을 위한 로그
                System.out.println("Month: " + result.getMonth() + ", Total Quantity: " + result.getProducedQuantity());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<ProductionResultDTO> getProductionByProduct() {
        List<ProductionResultDTO> list = new ArrayList<>();
        String query = "SELECT productType, SUM(ProducedQuantity) AS totalQuantity " +
                       "FROM ProductionResult GROUP BY productType";

        try (Connection con = getDataSource().getConnection(); // DB 연결 획득
                PreparedStatement ps = con.prepareStatement(query)) { // 쿼리 준비
               ResultSet rs = ps.executeQuery(); // 쿼리 실행 후 결과를 ResultSet으로 받음 {

            while (rs.next()) {
                ProductionResultDTO result = new ProductionResultDTO();
                result.setProductType(rs.getString("productType"));
                result.setProducedQuantity(rs.getInt("totalQuantity"));
                list.add(result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<ProductionResultDTO> getProductionById() {
        List<ProductionResultDTO> list = new ArrayList<>();
        String query = "SELECT production_id, SUM(ProducedQuantity) AS totalQuantity " +
                       "FROM ProductionResult GROUP BY production_id";

        try (Connection con = getDataSource().getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductionResultDTO result = new ProductionResultDTO();
                result.setProductionID(rs.getString("production_id"));
                result.setProducedQuantity(rs.getInt("totalQuantity"));
                list.add(result);

                // 데이터를 콘솔에 출력하여 확인
                System.out.println("Production ID: " + result.getProductionID() + ", Produced Quantity: " + result.getProducedQuantity());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    
}