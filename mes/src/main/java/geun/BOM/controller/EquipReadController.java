package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.EquipmentDTO;
import geun.BOM.service.EquipService;


@WebServlet("/Equip/read")
public class EquipReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Equip Read Controller doGet 실행");
		
		String equiID = request.getParameter("equiID");

		
		EquipService service = new EquipService();
		EquipmentDTO dto = service.get(equiID);
		
		request.setAttribute("Equip", dto);
		
		request.getRequestDispatcher("/WEB-INF/information/facility/정보_설비코드_Read.jsp").forward(request, response);
	}

}
