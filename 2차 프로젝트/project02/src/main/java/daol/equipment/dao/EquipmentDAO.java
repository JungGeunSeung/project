package daol.equipment.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import daol.equipment.dto.EquipmentDTO;

public class EquipmentDAO {

	private DataSource dataSource;

	public EquipmentDAO() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
		List<EquipmentDTO> equipmentList = new ArrayList<>();
		String sql = "SELECT * FROM ( "
				+ "SELECT e.equiID, e.equiname, e.equitype, e.selldate, e.equiloc, e.status, m.manager, m.maindate, m.maincontent, "
				+ "ROWNUM AS rnum " + "FROM equipment e " + "JOIN maintenance m ON e.equiID = m.equiID "
				+ "WHERE ROWNUM <= ? " + "ORDER BY " + sortField + " " + sortOrder + ") WHERE rnum > ?";
		
		System.out.println("Executing SQL: " + sql);
		try (Connection cnt = getConnection(); PreparedStatement ps = cnt.prepareStatement(sql)) {

			int endRow = pageNumber * pageSize;
			int startRow = endRow - pageSize + 1;

			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			System.out.println("Start Row: " + startRow + ", End Row: " + endRow); //디버깅용 로그확인
			ResultSet rs = ps.executeQuery();
			

			while (rs.next()) {
				EquipmentDTO equipment = new EquipmentDTO();
				equipment.setEquiID(rs.getString("equiID"));
				equipment.setEquiname(rs.getString("equiname"));
				equipment.setEquitype(rs.getString("equitype"));
				equipment.setSelldate(rs.getDate("selldate"));
				equipment.setEquiloc(rs.getString("equiloc"));
				equipment.setStatus(rs.getString("status"));
				equipment.setManager(rs.getString("manager"));
				equipment.setMaindate(rs.getDate("maindate"));
				equipment.setMaincontent(rs.getString("maincontent"));
				equipmentList.add(equipment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("dao : "+equipmentList);
		return equipmentList;
	}

	public int getTotalEquipmentCount() {
		int count = 0;
		String sql = "SELECT COUNT(*) FROM equipment";

		try (Connection cnt = getConnection();
				PreparedStatement ps = cnt.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public void addEquipment(EquipmentDTO equipment) {
	    String sql = "INSERT INTO equipment (equiID, equiname, equitype, selldate, equiloc, status) VALUES (?, ?, ?, ?, ?, ?)";
	    String sqlMaintenance = "INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager) VALUES (?, ?, ?, ?, ?)";

	    try (Connection cnt = getConnection();
	         PreparedStatement ps = cnt.prepareStatement(sql);
	         PreparedStatement psMaintenance = cnt.prepareStatement(sqlMaintenance)) {

	        // equipment 테이블에 삽입
	        ps.setString(1, equipment.getEquiID());
	        ps.setString(2, equipment.getEquiname());
	        ps.setString(3, equipment.getEquitype());
	        ps.setDate(4, new java.sql.Date(equipment.getSelldate().getTime()));
	        ps.setString(5, equipment.getEquiloc());
	        ps.setString(6, equipment.getStatus());
	        ps.executeUpdate();

	        // maintenance 테이블에 삽입
	        psMaintenance.setString(1, "main" + UUID.randomUUID().toString());
	        psMaintenance.setString(2, equipment.getEquiID());
	        psMaintenance.setDate(3, new java.sql.Date(equipment.getMaindate().getTime()));
	        psMaintenance.setString(4, equipment.getMaincontent());
	        psMaintenance.setString(5, equipment.getManager());
	        psMaintenance.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


	public void updateEquipment(EquipmentDTO equipment) {
	    String sql = "UPDATE equipment SET equiname = ?, equitype = ?, selldate = ?, equiloc = ?, status = ? WHERE equiID = ?";
	    String sqlMaintenance = "UPDATE maintenance SET maindate = ?, maincontent = ?, manager = ? WHERE equiID = ?";

	    Connection cnt = null;

	    try {
	        cnt = getConnection();
	        cnt.setAutoCommit(false); // 트랜잭션 시작

	        try (PreparedStatement ps = cnt.prepareStatement(sql);
	             PreparedStatement psMaintenance = cnt.prepareStatement(sqlMaintenance)) {

	            // equipment 테이블 업데이트
	            ps.setString(1, equipment.getEquiname());
	            ps.setString(2, equipment.getEquitype());
	            ps.setDate(3, new java.sql.Date(equipment.getSelldate().getTime()));
	            ps.setString(4, equipment.getEquiloc());
	            ps.setString(5, equipment.getStatus());
	            ps.setString(6, equipment.getEquiID());
	            ps.executeUpdate();

	            // maintenance 테이블 업데이트
	            psMaintenance.setDate(1, new java.sql.Date(equipment.getMaindate().getTime()));
	            psMaintenance.setString(2, equipment.getMaincontent());
	            psMaintenance.setString(3, equipment.getManager());
	            psMaintenance.setString(4, equipment.getEquiID());
	            psMaintenance.executeUpdate();

	            cnt.commit(); // 트랜잭션 커밋
	        } catch (SQLException e) {
	            cnt.rollback(); // 오류 발생 시 롤백
	            throw e;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (cnt != null) {
	            try {
	                cnt.setAutoCommit(true); // 자동 커밋 모드로 복원
	                cnt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}


	public void deleteEquipment(String equiID) {
		String sql = "DELETE FROM equipment WHERE equiID = ?";
		String sqlMaintenance = "DELETE FROM maintenance WHERE equiID = ?";

		try (Connection cnt = getConnection();
				PreparedStatement ps = cnt.prepareStatement(sql);
				PreparedStatement psMaintenance = cnt.prepareStatement(sqlMaintenance)) {

			ps.setString(1, equiID);
			ps.executeUpdate();

			psMaintenance.setString(1, equiID);
			psMaintenance.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<EquipmentDTO> getEquipmentByDateRange(Date startDate, Date endDate) {
	    List<EquipmentDTO> equipmentList = new ArrayList<>();
	    String sql = "SELECT e.equiID, e.equiname, e.equitype, e.selldate, e.equiloc, e.status, "
	               + "m.maincontent, m.manager, m.maindate "
	               + "FROM equipment e "
	               + "LEFT JOIN maintenance m ON e.equiID = m.equiID "
	               + "WHERE m.maindate BETWEEN ? AND ?";

	    try (Connection cnt = getConnection(); PreparedStatement ps = cnt.prepareStatement(sql)) {

	        ps.setDate(1, startDate);
	        ps.setDate(2, endDate);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            EquipmentDTO equipment = new EquipmentDTO();
	            equipment.setEquiID(rs.getString("equiID"));
	            equipment.setEquiname(rs.getString("equiname"));
	            equipment.setEquitype(rs.getString("equitype"));
	            equipment.setSelldate(rs.getDate("selldate")); // 날짜를 직접 Date로 받음
	            equipment.setEquiloc(rs.getString("equiloc"));
	            equipment.setStatus(rs.getString("status"));
	            equipment.setMaincontent(rs.getString("maincontent"));
	            equipment.setManager(rs.getString("manager"));
	            equipment.setMaindate(rs.getDate("maindate"));
	            equipmentList.add(equipment);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return equipmentList;
	}


	public EquipmentDTO getEquipmentById(String equiID) {
		EquipmentDTO equipment = null;
		String sql = "SELECT e.equiID, e.equiname, e.equitype, e.selldate, e.equiloc, e.status, "
				+ "m.maincontent, m.manager, m.maindate " // maintenance 테이블의 필요한 컬럼 추가
				+ "FROM equipment e " + "JOIN maintenance m ON e.equiID = m.equiID " // equiID를 기준으로 조인
				+ "WHERE e.equiID = ?";

		try (Connection cnt = getConnection(); PreparedStatement pstmt = cnt.prepareStatement(sql)) {

			pstmt.setString(1, equiID);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					equipment = new EquipmentDTO();
					equipment.setEquiID(rs.getString("equiID"));
					equipment.setEquiname(rs.getString("equiname"));
					equipment.setEquitype(rs.getString("equitype"));
					equipment.setSelldate(rs.getDate("selldate"));
					equipment.setEquiloc(rs.getString("equiloc"));
					equipment.setStatus(rs.getString("status"));
					equipment.setMaincontent(rs.getString("maincontent"));
					equipment.setManager(rs.getString("manager"));
					equipment.setMaindate(rs.getDate("maindate"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return equipment;
	}

}
