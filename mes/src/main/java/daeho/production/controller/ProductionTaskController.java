package daeho.production.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daeho.production.dto.ProductionTaskDTO;
import daeho.production.service.ProductionTaskService;

import com.google.gson.Gson;


@WebServlet("/task")
public class ProductionTaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductionTaskService taskService;


	 @Override
	    public void init() throws ServletException {
	        taskService = new ProductionTaskService();
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if (action == null) {
	            List<ProductionTaskDTO> tasks = taskService.getAllTasks();
	            request.setAttribute("tasks", tasks);
	            request.getRequestDispatcher("/생산관리_생산실적보고서.jsp").forward(request, response);
	        } else if (action.equals("getTask")) {
	            // AJAX 요청으로 task 데이터를 가져와 JSON으로 응답
	            String taskID = request.getParameter("taskID");
	            ProductionTaskDTO task = taskService.getTaskByID(taskID);

	            // JSON 형식으로 변환하여 응답 (Gson 사용)
	            response.setContentType("application/json");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write(new Gson().toJson(task));
	        } else if (action.equals("delete")) {
	            String taskID = request.getParameter("taskID");
	            taskService.deleteTask(taskID);
	            response.sendRedirect("task");
	        }
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String taskID = request.getParameter("taskID");
	        String planID = request.getParameter("planID");
	        String productionID = request.getParameter("productionID");
	        int required = Integer.parseInt(request.getParameter("required"));
	        int used = Integer.parseInt(request.getParameter("used"));
	        String taskStatus = request.getParameter("taskStatus");
	        String taskContent = request.getParameter("taskContent");

	        ProductionTaskDTO task = new ProductionTaskDTO(taskID, planID, productionID, required, used, taskStatus, taskContent);

	        if (request.getParameter("action").equals("update")) {
	            taskService.updateTask(task);
	        } else {
	            taskService.createTask(task);
	        }

	        // AJAX 요청이므로 리다이렉트 없이 응답
	        response.setContentType("text/plain");
	        response.getWriter().write("success");
	    }
	}



