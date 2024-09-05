package geun.BOM.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.Doc_Service;


@WebServlet("/doc/delete")
public class DocDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doc Delete Controller doPost 실행");
		String document_id = request.getParameter("document_id");
		
		Doc_Service service = new Doc_Service();
		int dto = service.delete(Integer.parseInt(document_id));
		response.sendRedirect("list");
	
		
	}

}
