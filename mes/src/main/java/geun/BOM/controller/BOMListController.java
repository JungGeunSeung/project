package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.BOM_DTO;
import geun.BOM.service.BOM_Service;
@WebServlet("/BOM/list")
public class BOMListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOMReadController doGet 실행");
		
		BOM_Service bomService = new BOM_Service();
		List<BOM_DTO> bomList = bomService.getList();
		
		request.setAttribute("list", bomList);
		
		request.getRequestDispatcher("/WEB-INF/정보_BOM.jsp").forward(request, response);
	}

}
