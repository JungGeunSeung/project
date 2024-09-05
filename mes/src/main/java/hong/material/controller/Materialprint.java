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


/**
 * Servlet implementation class Materialprint
 */
@WebServlet("/Materialprint")
public class Materialprint extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MaterialService materialService = new MaterialService();
		int num = Integer.parseInt(request.getParameter("num"));
		MaterialDTO dto = materialService.print(num);
		request.setAttribute("dto", dto);
		//이곳에 inventorystatus안의 prodnum을 list로 받아오는 코드 생성
		//이곳에 inventorystatus안의 prodnum을 setattribute하는 코드 생성
		request.getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		java.util.Date utildate = new java.util.Date();
		MaterialService materialService = new MaterialService();
		MaterialDTO dto = new MaterialDTO();
		int num = Integer.parseInt(request.getParameter("inum"));
		dto.setnum(num);
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
		materialService.update(dto);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/update.jsp").forward(request, response);
	}

	

}
