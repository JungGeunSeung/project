package geun.BOM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.BOM_DTO;
import geun.BOM.service.BOM_Service;

@WebServlet("/BOM/create")
public class BOMCreateContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		System.out.println("BOM Create Contoller doGet 실행");
		
		request.getRequestDispatcher("/WEB-INF/information/BOM/정보_BOM_Create.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		System.out.println("BOM Create Contoller doPost 실행");
		
		String bom_id = request.getParameter("bom_id");
		String production_id = request.getParameter("production_id");
		String mid = request.getParameter("mid");
		String bom_quantity = request.getParameter("bom_quantity");
		
		BOM_DTO dto = new BOM_DTO();
		dto.setBom_id(bom_id);
		dto.setProduction_id(production_id);
		dto.setMid(mid);
		dto.setBom_quantity(Integer.parseInt(bom_quantity));
		
		BOM_Service service = new BOM_Service();
		int result = service.register(dto);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/BOM/list");
	}

}
