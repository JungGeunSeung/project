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

        // 올바르게 수정된 SQL 쿼리
        String sql = "SELECT * FROM ( "
                   + "SELECT e.RESULTID, e.EQUIID, eq.EQUINAME, e.DOWNTIME_HISTORY, e.DOWN_REASON, ROWNUM rnum "
                   + "FROM equipmentusage e "
                   + "JOIN equipment eq ON e.EQUIID = eq.EQUIID "
                   + "ORDER BY " + sortField + " " + sortOrder + " ) "
                   + "WHERE rnum BETWEEN ? AND ?";

        try (Connection cnt = getConnection(); PreparedStatement ps = cnt.prepareStatement(sql)) {
            int endRow = pageNumber * pageSize;
            int startRow = endRow - pageSize + 1;
            
            ps.setInt(1, startRow);
            ps.setInt(2, endRow);
            System.out.println("dao : "+ ps);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                NonOperHistoryDTO nonOperHistory = new NonOperHistoryDTO();
                nonOperHistory.setResultID(rs.getString("RESULTID"));
                nonOperHistory.setEquiID(rs.getString("EQUIID"));
                nonOperHistory.setEquiName(rs.getString("EQUINAME"));  // 설비명 가져오기
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
        String sql = "SELECT RESULTID FROM equipmentusage";

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
        String sql = "INSERT INTO equipmentusage (RESULTID, EQUIID, DOWNTIME_HISTORY, DOWN_REASON) "
                   + "VALUES (equipmentusage_seq.NEXTVAL, ?, ?, ?)"; // 시퀀스로 resultID 자동 생성

        try (Connection cnt = getConnection();
             PreparedStatement ps = cnt.prepareStatement(sql)) {

            ps.setString(1, nonOperHistory.getEquiID());
            ps.setString(2, nonOperHistory.getDowntimeHistory());
            ps.setString(3, nonOperHistory.getDownReason());
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
