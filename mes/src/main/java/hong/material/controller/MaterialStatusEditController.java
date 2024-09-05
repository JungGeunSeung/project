package hong.material.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialStatusDTO;
import hong.material.service.MaterialStatusService;



@WebServlet("/mse")
public class MaterialStatusEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MaterialStatusService service = new MaterialStatusService();
		String str = request.getParameter("prodnum");
		System.out.println(str);
		MaterialStatusDTO dto = service.print(str);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/material/editstatus.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		java.util.Date utildate = new java.util.Date();
		MaterialStatusService service = new MaterialStatusService();
		MaterialStatusDTO dto = new MaterialStatusDTO();
		System.out.println("mse post 확인");
		dto.setProdnum(request.getParameter("prodnum"));
		dto.setLotnum(request.getParameter("lotnum"));
		dto.setProdname(request.getParameter("prodname"));
		dto.setTquantity(Integer.parseInt(request.getParameter("quantity")));
		dto.setSpec(request.getParameter("spec"));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//string으로 받은 날짜를 다시 날짜로 변환하는 과정
		String formatdate = format.format(utildate);
		java.sql.Date date = java.sql.Date.valueOf(formatdate);
		
		dto.setStorage_loc(request.getParameter("loc"));
		dto.setEditdate(date);
		service.update(dto);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/material/update.jsp").forward(request, response);
	}

}
