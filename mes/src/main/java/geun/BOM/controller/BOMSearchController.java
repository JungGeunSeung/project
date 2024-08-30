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
		System.out.println("BOMPageController doGet 실행");

        String bom_id = request.getParameter("bom_id");
        
        System.out.println("bom_id : " + bom_id);

        BOM_Service service = new BOM_Service();
        List list = service.getBOM(bom_id);

        request.setAttribute("list", list);

        request.getRequestDispatcher("/WEB-INF/정보_BOM.jsp").forward(request, response);
	
	}

}
