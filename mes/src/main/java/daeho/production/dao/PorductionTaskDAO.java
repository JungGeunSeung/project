package daeho.production.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import daeho.production.dto.ProductionTaskDTO;

public class PorductionTaskDAO {
	
	// DB 연결 메서드
    private Connection getConnection() throws Exception {
        // JNDI를 통해 데이터 소스 검색
        Context ctx = new InitialContext();
        DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
        return dataSource.getConnection(); // 연결 반환
    }

    // Create
    public void createTask(ProductionTaskDTO task) {
        String query = "INSERT INTO task (taskid, planid, production_id, required, used, taskstatus, taskcontent) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, task.getTaskID());
            pstmt.setString(2, task.getPlanID());
            pstmt.setString(3, task.getProductionID());
            pstmt.setInt(4, task.getRequired());
            pstmt.setInt(5, task.getUsed());
            pstmt.setString(6, task.getTaskStatus());
            pstmt.setString(7, task.getTaskContent());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Read (Get all tasks)
    public List<ProductionTaskDTO> getAllTasks() {
        List<ProductionTaskDTO> tasks = new ArrayList<>();
        String query = "SELECT * FROM task";
        
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                ProductionTaskDTO task = new ProductionTaskDTO(
                    rs.getString("taskid"),
                    rs.getString("planid"),
                    rs.getString("production_id"),
                    rs.getInt("required"),
                    rs.getInt("used"),
                    rs.getString("taskstatus"),
                    rs.getString("taskcontent")
                );
                tasks.add(task);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tasks;
    }

    // Read (Get task by ID)
    public ProductionTaskDTO getTaskByID(String taskID) {
    	ProductionTaskDTO task = null;
        String query = "SELECT * FROM task WHERE taskid = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, taskID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    task = new ProductionTaskDTO(
                        rs.getString("taskid"),
                        rs.getString("planid"),
                        rs.getString("production_id"),
                        rs.getInt("required"),
                        rs.getInt("used"),
                        rs.getString("taskstatus"),
                        rs.getString("taskcontent")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return task;
    }

    // Update
    public void updateTask(ProductionTaskDTO task) {
        String query = "UPDATE task SET planid = ?, production_id = ?, required = ?, used = ?, taskstatus = ?, taskcontent = ? WHERE taskid = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, task.getPlanID());
            pstmt.setString(2, task.getProductionID());
            pstmt.setInt(3, task.getRequired());
            pstmt.setInt(4, task.getUsed());
            pstmt.setString(5, task.getTaskStatus());
            pstmt.setString(6, task.getTaskContent());
            pstmt.setString(7, task.getTaskID());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete
    public void deleteTask(String taskID) {
        String query = "DELETE FROM task WHERE taskid = ?";
        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, taskID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
