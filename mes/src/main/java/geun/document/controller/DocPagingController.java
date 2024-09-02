
package geun.document.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.document.service.Doc_Service;


@WebServlet("/doc/list")
public class DocPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOMPagingController doGet 실행");
		
		
		String countPerPage = request.getParameter("countPerPage");
		String page = request.getParameter("page");
		
		if(countPerPage == null) countPerPage = "10";
		
		if(page == null) page = "1";
		
		Doc_Service service = new Doc_Service();
		
		Map map = service.getDocPage(countPerPage, page);
		
		request.setAttribute("map", map);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("page", page);
        
        request.getRequestDispatcher("/WEB-INF/정보_BOM문서관리.jsp").forward(request, response);
	}

}
