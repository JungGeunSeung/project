
package geun.BOM.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.EquipmentDTO;
import geun.BOM.service.EquipService;


@WebServlet("/Equip/list")
public class EquipPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Equip Paging Controller doGet 실행");
		
		String countPerPage = request.getParameter("countPerPage");
		String page = request.getParameter("page");
		
		if(countPerPage == null) countPerPage = "10";
		
		if(page == null) page = "1";
		
		EquipService service = new EquipService();
		
		Map map = service.getEquipPage(countPerPage, page);
		System.out.println("map : "+map);
		request.setAttribute("map", map);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("page", page);
        
        request.getRequestDispatcher("/WEB-INF/information/facility/정보_설비코드.jsp").forward(request, response);
	}

}
