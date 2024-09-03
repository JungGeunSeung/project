package daol.equipment.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EquipmentDTO {
	private String equiID;
	private String equiname;
	private String equitype;
	private String manager;
	private Date maindate;
	private String maincontent;
	private String equiloc; // 새로운 속성 추가
	private String status;
	
	public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
	    List<EquipmentDTO> equipmentList = new ArrayList<>();
	    String sql = "SELECT * FROM ( " +
	                 "SELECT e.equiID, e.equiname, e.equitype, m.manager, m.maindate, m.maincontent, " +
	                 "ROWNUM AS rnum " +
	                 "FROM equipment e " +
	                 "JOIN maintenance m ON e.equiID = m.equiID " +
	                 "ORDER BY " + sortField + " " + sortOrder + " " +
	                 "WHERE ROWNUM <= ? " +
	                 ") WHERE rnum > ?";

	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        int endRow = pageNumber * pageSize;
	        int startRow = endRow - pageSize + 1;

	        ps.setInt(1, endRow);
	        ps.setInt(2, startRow);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            EquipmentDTO equipment = new EquipmentDTO();
	            equipment.setEquiID(rs.getString("equiID"));
	            equipment.setEquiname(rs.getString("equiname"));
	            equipment.setEquitype(rs.getString("equitype"));
	            equipment.setManager(rs.getString("manager"));
	            equipment.setMaindate(rs.getDate("maindate"));
	            equipment.setMaincontent(rs.getString("maincontent"));
	            equipmentList.add(equipment);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return equipmentList;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// Getters and Setters

	public String getEquiID() {
		return equiID;
	}

	public void setEquiID(String equiID) {
		this.equiID = equiID;
	}

	public String getEquiname() {
		return equiname;
	}

	public void setEquiname(String equiname) {
		this.equiname = equiname;
	}

	public String getEquitype() {
		return equitype;
	}

	public void setEquitype(String equitype) {
		this.equitype = equitype;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public Date getMaindate() {
		return maindate;
	}

	public void setMaindate(Date maindate) {
		this.maindate = maindate;
	}

	public String getMaincontent() {
		return maincontent;
	}

	public void setMaincontent(String maincontent) {
		this.maincontent = maincontent;
	}

	public String getEquiloc() { // 새로운 getter 메서드
		return equiloc;
	}

	public void setEquiloc(String equiloc) { // 새로운 setter 메서드
		this.equiloc = equiloc;
	}



}
