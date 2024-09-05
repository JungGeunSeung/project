package sowon.quality.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sowon.quality.dto.DefectDTO;

public class DefectDAO {

	private Connection getConnection() {

		Connection con = null;

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@125.181.132.133:51521:xe";
		String user = "scott2_8";
		String password = "tiger";

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public List<DefectDTO> selectAll() {
		System.out.println("DAO 실행");

		List<DefectDTO> list = new ArrayList<DefectDTO>();

		try {

			Connection con = getConnection();

			String query = "select * from DefectType";
			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String report_id = rs.getString("report_id");
				String ins_id = rs.getString("ins_id");
				String production_id = rs.getString("production_id");
				String planid = rs.getString("planid");
				int defect_count = rs.getInt("defect_count");

				DefectDTO dto = new DefectDTO();
				dto.setReport_id(report_id);
				dto.setIns_id(ins_id);
				dto.setProduction_id(production_id);
				dto.setPlanid(planid);
				dto.setDefect_count(defect_count);

				list.add(dto);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public DefectDTO selectOne(String report_id) {
		DefectDTO defectDTO = null;
		Connection con = getConnection();

		if (con == null)
			return null;

		try {
			System.out.println("DefectTypeDAO의 selectOne 메소드 실행 및 SQL 준비");

			String sql = "select * from DefectType where report_id = ?";

			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("DAO : " + report_id);
			ps.setString(1, report_id);
			System.out.println("ps" + ps);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				System.out.println("rs.next() 작동함");
				DefectDTO dto = new DefectDTO();
				dto.setReport_id(rs.getString("report_id"));
				dto.setIns_id(rs.getString("ins_id"));
				dto.setProduction_id(rs.getString("production_id"));
				dto.setPlanid(rs.getString("planid"));
				dto.setDefect_count(rs.getInt("defect_count"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("defectDTO : " + defectDTO);
		return defectDTO;
	}

	public int update(DefectDTO dto) {
		int result = 0;
		try {
			Context ctx = new InitialContext();
			DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = dataFactory.getConnection();

//		        String query = "UPDATE DefectType SET ins_id=?, production_id=?, planid=?, report_id=? WHERE defect_count=?";
			String query = "UPDATE DefectType SET defect_count=? WHERE report_id=? ";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, dto.getDefect_count());
			ps.setString(2, dto.getReport_id());
//		        ps.setString(2, dto.getIns_id());
//		        ps.setString(3, dto.getProduction_id());
//		        ps.setString(4, dto.getPlanid());
//		        ps.setInt(5, dto.getDefect_count());

			result = ps.executeUpdate();
			System.out.println("업데이트된 행 수: " + result);

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int delete(String report_id) {

		int result = 0;
		try {
			Context ctx = new InitialContext();
			DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = dataFactory.getConnection();

			String query = "delete from DefectType where report_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, report_id);

			result = ps.executeUpdate();

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List selectDefectPage(int start, int end) {
		System.out.println("DefectDAO의 selectDefectPage메소드 실행");

		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			con = dataSource.getConnection();

			String query = " select * ";
			query += " from ( ";
			query += "    select rownum rnum, report_id, ins_id, production_id, planid, defect_count ";
			query += "    from ( ";
			query += "        select report_id, ins_id, production_id, planid, defect_count ";
			query += "        from DefectType ";
			query += "        order by report_id ";
			query += "    ) ";
			query += " ) ";
			query += " where rnum >= ? and rnum <= ?";

			ps = con.prepareStatement(query);

			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();

			while (rs.next()) {
				String report_id = rs.getString("report_id");
				String ins_id = rs.getString("ins_id");
				String production_id = rs.getString("production_id");
				String planid = rs.getString("planid");
				int defect_count = rs.getInt("defect_count");

				DefectDTO dto = new DefectDTO();
				dto.setReport_id(report_id);
				dto.setIns_id(ins_id);
				dto.setProduction_id(production_id);
				dto.setPlanid(planid);
				dto.setDefect_count(defect_count);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	// 전체 데이터베이스의 데이터 개수를 구하는 메소드
	public int totalDefectPage() {

		int result = -1;

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			con = dataSource.getConnection();

			String query = "select count(*) cnt from DefectType ";

			ps = con.prepareStatement(query);

			rs = ps.executeQuery();

			if (rs.next()) {
				result = rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public List selectDefect(String report_id) {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			con = dataSource.getConnection();

			String query = "SELECT * FROM DefectType ";

			if (report_id != null && !(report_id.equals(""))) {
				query += " where report_id= '" + report_id + "'";
			}

			ps = con.prepareStatement(query);

			rs = ps.executeQuery();

			while (rs.next()) {
				String report_id1 = rs.getString("report_id");
				String ins_id = rs.getString("ins_id");
				String production_id = rs.getString("production_id");
				String planid = rs.getString("planid");
				int defect_count = rs.getInt("defect_count");

				DefectDTO dto = new DefectDTO();
				dto.setReport_id(report_id1);
				dto.setIns_id(ins_id);
				dto.setProduction_id(production_id);
				dto.setPlanid(planid);
				dto.setDefect_count(defect_count);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	public List selectPro(String report_id) {
		List list = new ArrayList();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			con = dataSource.getConnection();

			String query = "SELECT * FROM DefectType WHERE report_id = ?";

			ps = con.prepareStatement(query);

			ps.setString(1, report_id);

			rs = ps.executeQuery();

			while (rs.next()) {
				String report_id1 = rs.getString("report_id");
				String ins_id = rs.getString("ins_id");
				String production_id = rs.getString("production_id");
				String planid = rs.getString("planid");
				int defect_count = rs.getInt("defect_count");

				DefectDTO dto = new DefectDTO();
				dto.setReport_id(report_id1);
				dto.setIns_id(ins_id);
				dto.setProduction_id(production_id);
				dto.setPlanid(planid);
				dto.setDefect_count(defect_count);

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list; // 결과 반환
	}

	public DefectDTO get(String id) {
		DefectDAO dao = new DefectDAO();
		return dao.selectOne(id); // tno 속성을 사용하지 않도록 수정
	}

}
