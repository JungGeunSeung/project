package geun.BOM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.BOM_Service;

@WebServlet("/BOM/delete")
public class BOMDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOM Delete Controller doPost 실행");
		String bom_id = request.getParameter("bom_id");
		
		BOM_Service service = new BOM_Service();
		
		int dto = service.delete(bom_id);
		
		response.sendRedirect("list");
	
		
	}

}
