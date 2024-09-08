package daol.equipment.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import daol.equipment.dto.NonOperHistoryDTO;

public class NonOperHistoryDAO {
    private DataSource dataSource;

    public NonOperHistoryDAO() {
        try {
            Context ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    private Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    private NonOperHistoryDTO mapResultSetToDTO(ResultSet rs) throws SQLException {
        NonOperHistoryDTO dto = new NonOperHistoryDTO();
        dto.setResultID(rs.getString("RESULTID"));
        dto.setEquiID(rs.getString("EQUIID"));
        dto.setDowntimeHistory(rs.getString("DOWNTIME_HISTORY"));
        dto.setDownReason(rs.getString("DOWN_REASON"));
        return dto;
    }

    public List<NonOperHistoryDTO> getNonOperHistoryByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
        List<NonOperHistoryDTO> nonOperHistoryList = new ArrayList<>();
        
        // 수정된 SQL 쿼리
        String sql = "SELECT * FROM ( "
                + "SELECT a.*, ROWNUM AS rnum FROM ( "
                + "SELECT e.RESULTID, e.EQUIID, e.DOWNTIME_HISTORY, e.DOWN_REASON "
                + "FROM equipmentusage e "
                + "ORDER BY " + sortField + " " + sortOrder + ") a "
                + "WHERE ROWNUM <= ? ) WHERE rnum >= ?";

        try (Connection cnt = getConnection(); PreparedStatement ps = cnt.prepareStatement(sql)) {
            int endRow = pageNumber * pageSize;
            int startRow = endRow - pageSize + 1;

            ps.setInt(1, endRow);  // 끝나는 행
            ps.setInt(2, startRow);  // 시작 행

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                NonOperHistoryDTO nonOperHistory = new NonOperHistoryDTO();
                nonOperHistory.setResultID(rs.getString("RESULTID"));
                nonOperHistory.setEquiID(rs.getString("EQUIID"));
                nonOperHistory.setDowntimeHistory(rs.getString("DOWNTIME_HISTORY"));
                nonOperHistory.setDownReason(rs.getString("DOWN_REASON"));
                nonOperHistoryList.add(nonOperHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nonOperHistoryList;
    }

    

    public String getDefaultResultID() {
        String resultID = null;
        String sql = "SELECT MAX(RESULTID) AS RESULTID FROM equipmentusage";

        try (Connection cnt = getConnection();
             PreparedStatement ps = cnt.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                resultID = rs.getString("RESULTID");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error fetching default resultID", e);
        }
        return resultID;
    }

    public void addNonOperHistory(NonOperHistoryDTO nonOperHistory) {
        String sql = "INSERT INTO equipmentusage (RESULTID, EQUIID, DOWNTIME_HISTORY, DOWN_REASON) VALUES (?, ?, ?, ?)";

        try (Connection cnt = getConnection();
             PreparedStatement ps = cnt.prepareStatement(sql)) {

            ps.setString(1, nonOperHistory.getResultID());
            ps.setString(2, nonOperHistory.getEquiID());
            ps.setString(3, nonOperHistory.getDowntimeHistory());
            ps.setString(4, nonOperHistory.getDownReason());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error inserting non-oper history", e);
        }
    }
    
    public void updateNonOperHistory(NonOperHistoryDTO nonOperHistory) {
        String sql = "UPDATE equipmentusage SET DOWNTIME_HISTORY = ?, DOWN_REASON = ? WHERE RESULTID = ? AND EQUIID = ?";

        try (Connection cnt = getConnection();
             PreparedStatement ps = cnt.prepareStatement(sql)) {

            ps.setString(1, nonOperHistory.getDowntimeHistory());
            ps.setString(2, nonOperHistory.getDownReason());
            ps.setString(3, nonOperHistory.getResultID());
            ps.setString(4, nonOperHistory.getEquiID());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating non-oper history", e);
        }
    }

    public void deleteNonOperHistory(String resultID, String equiID) {
        String sql = "DELETE FROM equipmentusage WHERE RESULTID = ? AND EQUIID = ?";

        try (Connection cnt = getConnection();
             PreparedStatement ps = cnt.prepareStatement(sql)) {

            ps.setString(1, resultID);
            ps.setString(2, equiID);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting non-oper history", e);
        }
    }
}
