package geun.document.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.document.service.Doc_Service;


@WebServlet("/doc/list/search")
public class DocSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DocSearchController doGet 실행");

        String document_id = request.getParameter("document_id");
        System.out.println(document_id);
        Doc_Service service = new Doc_Service();
        List list = service.getDoc(document_id);

        request.setAttribute("bom", list);

        request.getRequestDispatcher("/WEB-INF/정보_BOM문서관리_search.jsp").forward(request, response);
	
	}

}
