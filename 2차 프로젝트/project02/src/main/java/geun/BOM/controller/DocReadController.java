package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.DocumentDTO;
import geun.BOM.service.Doc_Service;


@WebServlet("/doc/read")
public class DocReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doc Read Controller doGet 실행");
		String docID = request.getParameter("document_id");
		
		String docID2 = null;
		if(docID != null) {
			docID2 = docID;
		} else {
			System.out.println("docID : " + "null");
		}
		
		Doc_Service service = new Doc_Service();
		DocumentDTO dto = service.get(docID2);
		
		request.setAttribute("doc", dto);
		
		request.getRequestDispatcher("/WEB-INF/information/Documents/정보_BOM문서관리_Read.jsp").forward(request, response);
	}

}
