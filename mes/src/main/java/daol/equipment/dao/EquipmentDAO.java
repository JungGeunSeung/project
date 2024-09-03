package daol.equipment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber) {
        List<EquipmentDTO> equipmentList = new ArrayList<>();
        String sql = "SELECT * FROM ( " +
                     "SELECT e.equiID, e.equiname, e.equitype, m.manager, m.maindate, m.maincontent, " +
                     "ROWNUM AS rnum " +
                     "FROM equipment e " +
                     "JOIN maintenance m ON e.equiID = m.equiID " +
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

    public int getTotalEquipmentCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM equipment";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
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
        String sql = "INSERT INTO equipment (equiID, equiname, equitype) VALUES (?, ?, ?)";
        String sqlMaintenance = "INSERT INTO maintenance (mainID, equiID, maindate, maincontent, manager) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             PreparedStatement psMaintenance = conn.prepareStatement(sqlMaintenance)) {

            ps.setString(1, equipment.getEquiID());
            ps.setString(2, equipment.getEquiname());
            ps.setString(3, equipment.getEquitype());
            ps.executeUpdate();

            psMaintenance.setString(1, "main" + equipment.getEquiID());
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
        String sql = "UPDATE equipment SET equiname = ?, equitype = ? WHERE equiID = ?";
        String sqlMaintenance = "UPDATE maintenance SET maindate = ?, maincontent = ?, manager = ? WHERE equiID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             PreparedStatement psMaintenance = conn.prepareStatement(sqlMaintenance)) {

            ps.setString(1, equipment.getEquiname());
            ps.setString(2, equipment.getEquitype());
            ps.setString(3, equipment.getEquiID());
            ps.executeUpdate();

            psMaintenance.setDate(1, new java.sql.Date(equipment.getMaindate().getTime()));
            psMaintenance.setString(2, equipment.getMaincontent());
            psMaintenance.setString(3, equipment.getManager());
            psMaintenance.setString(4, equipment.getEquiID());
            psMaintenance.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEquipment(String equiID) {
        String sql = "DELETE FROM equipment WHERE equiID = ?";
        String sqlMaintenance = "DELETE FROM maintenance WHERE equiID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             PreparedStatement psMaintenance = conn.prepareStatement(sqlMaintenance)) {

            ps.setString(1, equiID);
            ps.executeUpdate();

            psMaintenance.setString(1, equiID);
            psMaintenance.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
