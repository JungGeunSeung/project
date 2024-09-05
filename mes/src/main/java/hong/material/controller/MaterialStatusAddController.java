package hong.material.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialStatusDTO;
import hong.material.service.MaterialStatusService;


/**
 * Servlet implementation class MaterialStatusAddController
 */
@WebServlet("/msa")
public class MaterialStatusAddController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MaterialStatusService service = new MaterialStatusService();
		java.util.Date utildate = new java.util.Date();
		MaterialStatusDTO dto = new MaterialStatusDTO();
		
		dto.setProdnum(request.getParameter("prodnum"));
		dto.setLotnum(request.getParameter("lotnum"));
		dto.setProdname(request.getParameter("prodname"));
		dto.setSpec(request.getParameter("spec"));
		dto.setStorage_loc(request.getParameter("loc"));
		
		service.create(dto);
	}

}
