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
		
		System.out.println("BOMCreateContoller doGet 실행");
		
		request.getRequestDispatcher("/WEB-INF/정보_BOM_Create.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		System.out.println("BOMCreateContoller doPost 실행");
		
		String bom_id = request.getParameter("bom_id");
		String production_id = request.getParameter("production_id");
		String mid = request.getParameter("mid");
		String bom_quantity = request.getParameter("bom_quantity");
		
		BOM_DTO dto = new BOM_DTO();
		dto.setBom_id(bom_id);
		dto.setProduction_id(production_id);
		dto.setMid(mid);
		dto.setBom_quantity(Integer.parseInt(bom_quantity));
		
		System.out.println(dto);
		
		// DB 의 insert까지 실행하여 가져와 담는다.
		BOM_Service service = new BOM_Service();
		int result = service.register(dto);
		System.out.println("insert 결과 :"+ result);
		
		// list 목록으로 보내기
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/BOM/list");
	}

}
