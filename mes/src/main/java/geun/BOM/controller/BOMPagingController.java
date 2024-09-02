
package geun.BOM.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.BOM_Service;

@WebServlet("/BOM/list")
public class BOMPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOMPagingController doGet 실행");
		
		
		String countPerPage = request.getParameter("countPerPage");
		String page = request.getParameter("page");
		
		if(countPerPage == null) countPerPage = "10";
		
		if(page == null) page = "1";
		
		BOM_Service service = new BOM_Service();
		
		Map map = service.getBOMPage(countPerPage, page);
		
		
		request.setAttribute("map", map);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("page", page);
        
        request.getRequestDispatcher("/WEB-INF/정보_BOM.jsp").forward(request, response);
	}

}
