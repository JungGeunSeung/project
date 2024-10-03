package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.BOM_Service;

@WebServlet("/BOM/list/search")
public class BOMSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOM Search Controller doGet 실행");

        String production_id = request.getParameter("production_id");
        System.out.println(production_id);
        BOM_Service service = new BOM_Service();
        List list = service.getBOM(production_id);

        request.setAttribute("bom", list);

        request.getRequestDispatcher("/WEB-INF/information/BOM/정보_BOM_search.jsp").forward(request, response);
	
	}

}
