package hong.material.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daeho.production.service.ProductionPlanService;


@WebServlet("/main")
public class MainpageController extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("production/list doGet실행");

		//한 페이지당 개수
		String countPerPage = request.getParameter("countPerPage");
		//현재 페이지
		String page = request.getParameter("page");
		
		//혹시 받은게 없다면 기본값 세팅
		if(countPerPage == null)countPerPage = "5";
		if(page == null)page = "1";
		

		ProductionPlanService empPageService = new ProductionPlanService();
		Map map = empPageService.getservicePage(countPerPage, page);
	
		request.setAttribute("map", map);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/WEB-INF/mainLogin/main.jsp").forward(request, response);
	}


}
