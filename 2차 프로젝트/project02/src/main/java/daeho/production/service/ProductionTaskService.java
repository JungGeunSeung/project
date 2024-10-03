package daeho.production.service;

import java.util.List;

import daeho.production.dao.PorductionTaskDAO;
import daeho.production.dto.ProductionTaskDTO;

public class ProductionTaskService {
	 private PorductionTaskDAO taskDAO;

	    public ProductionTaskService() {
	    	taskDAO = new PorductionTaskDAO();
	    }

	    public void createTask(ProductionTaskDTO task) {
	        taskDAO.createTask(task);
	    }

	    public List<ProductionTaskDTO> getAllTasks() {
	        return taskDAO.getAllTasks();
	    }

	    public ProductionTaskDTO getTaskByID(String taskID) {
	        return taskDAO.getTaskByID(taskID);
	    }

	    public void updateTask(ProductionTaskDTO task) {
	        taskDAO.updateTask(task);
	    }

	    public void deleteTask(String taskID) {
	        taskDAO.deleteTask(taskID);
	    }
	}
