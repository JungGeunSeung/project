package daol.equipment.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import daol.equipment.dao.EquipmentDAO;
import daol.equipment.dto.EquipmentDTO;

public class EquipmentService {
    private EquipmentDAO equipmentDAO;
    private BasicDataSource dataSource;
    

    public EquipmentService() {
        this.equipmentDAO = new EquipmentDAO();
        this.dataSource = new BasicDataSource();
        this.dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
        this.dataSource.setUsername("scott2_14");
        this.dataSource.setPassword("tiger");
        this.dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    }

    public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
        return equipmentDAO.getEquipmentByPage(pageSize, pageNumber, sortField, sortOrder);
    }


    public int getTotalEquipmentCount() {
        return equipmentDAO.getTotalEquipmentCount();
    }

    public void addEquipment(EquipmentDTO equipment) {
        equipmentDAO.addEquipment(equipment);
    }

    public void updateEquipment(EquipmentDTO equipment) {
        equipmentDAO.updateEquipment(equipment);
    }

    public void deleteEquipment(String equiID) {
        equipmentDAO.deleteEquipment(equiID);
    }

    public EquipmentDTO getEquipmentById(String equiID) {
        EquipmentDTO equipment = null;
        String sql = "SELECT * FROM equipment WHERE equiID = ?";
        
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, equiID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    equipment = new EquipmentDTO();
                    equipment.setEquiID(rs.getString("equiID"));
                    equipment.setEquiname(rs.getString("equiname"));
                    equipment.setEquitype(rs.getString("equitype"));
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

	public List<EquipmentDTO> getEquipmentByDateRange(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}
}
