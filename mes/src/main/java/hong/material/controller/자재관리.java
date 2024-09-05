package hong.material.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.service.MaterialService;




@WebServlet("/자재관리")
public class 자재관리 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MaterialService materialService = new MaterialService();
		List list = materialService.getMaterialList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/재고관리_자재입출고관리(자재관리).jsp").forward(request, response);
	}

}
