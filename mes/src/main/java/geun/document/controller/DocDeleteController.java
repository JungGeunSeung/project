package geun.document.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.document.service.Doc_Service;


@WebServlet("/doc/delete")
public class DocDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOMDeleteController doPost 실행");
		String bom_id = request.getParameter("bom_id");
		
		
		Doc_Service service = new Doc_Service();
		int dto = service.delete(Integer.parseInt(bom_id));
		System.out.println("삭제 :" + bom_id);
		System.out.println("삭제개수 :" + dto);
		response.sendRedirect("list");
	
		
	}

}
