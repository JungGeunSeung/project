package sowon.standard.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.standard.service.StandardService;

@WebServlet("/standard/list")
public class StandardPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/standard/page doGet 실행");

		// 한 페이지당 개수
        String countPerPage = request.getParameter("countPerPage");
        // 현재 페이지 
        String page = request.getParameter("page");
        
        // 혹시 받은게 없다면 기본값 세팅
        if(countPerPage == null) countPerPage = "10";
        if(page == null) page = "1";
        
        StandardService empPageService = new  StandardService();
        Map map = empPageService.getQualityPage(countPerPage, page);
        System.out.println(map);
        request.setAttribute("map", map);
        request.setAttribute("countPerPage", countPerPage);
        request.setAttribute("page", page);

       
        request.getRequestDispatcher("/WEB-INF/시험항목_Standard_modify.jsp").forward(request, response);
	}
	
}
