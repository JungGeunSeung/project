package geun.BOM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.EquipmentDTO;
import geun.BOM.service.EquipService;


@WebServlet("/Equip/delete")
public class EquipDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Equip Delete Controller doPost 실행");
		String equiID = request.getParameter("equiID");
		
		
		EquipService service = new EquipService();
		int dto = service.delete(equiID);
		response.sendRedirect("list");
	
		
	}

}
