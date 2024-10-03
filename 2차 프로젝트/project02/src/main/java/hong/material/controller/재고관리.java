package hong.material.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialStatusDTO;
import hong.material.service.MaterialStatusService;




@WebServlet("/stock/list")
public class 재고관리 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MaterialStatusService service = new MaterialStatusService();
		List<MaterialStatusDTO> list = service.getMaterialStatusList();
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/material/재고관리_자재현황관리.jsp").forward(request, response);
	}

}
