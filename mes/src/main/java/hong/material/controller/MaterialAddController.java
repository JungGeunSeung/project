package hong.material.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialDTO;
import hong.material.service.MaterialService;



@WebServlet("/materialadd")
public class MaterialAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MaterialService service = new MaterialService();
		java.util.Date utildate = new java.util.Date();
		MaterialDTO dto = new MaterialDTO();
		int inum = Integer.parseInt(request.getParameter("inum"));
		
		dto.setprodNum(request.getParameter("productnum"));
		dto.setLOTNum(request.getParameter("lotnum"));
		dto.setprodName(request.getParameter("productname"));
		dto.setInout(request.getParameter("inout"));
		dto.setCnt(Integer.parseInt(request.getParameter("count")));
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");//string으로 받은 날짜를 다시 날짜로 변환하는 과정
		String formatdate = format.format(utildate);
		java.sql.Date date = java.sql.Date.valueOf(formatdate);
		
		dto.setDate(date);
		dto.setChecker(request.getParameter("inspector"));
		
		System.out.println("inum = " + inum + " prodnum = " + request.getParameter("productnum"));
		service.create(dto);
	}

}
