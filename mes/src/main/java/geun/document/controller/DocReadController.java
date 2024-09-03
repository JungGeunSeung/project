package geun.document.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.document.dto.DocumentDTO;
import geun.document.service.Doc_Service;


@WebServlet("/doc/read")
public class DocReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doc Read Controller doGet 실행");
		String docID = request.getParameter("document_id");
		String production_id = request.getParameter("production_id");
		
		String docID2 = null;
		if(docID != null) {
			docID2 = docID;
		} else {
			System.out.println("docID : " + "null");
		}
		
		// TodoService를 호출하여 TodoDTO타입의 메소드를 호출하여 dto변수에 저장
		Doc_Service service = new Doc_Service();
		DocumentDTO dto = service.get(docID2);
		
		List promat = service.selectProduct(production_id);
		
		// 요청하는 곳에 키와 벨류로 저장
		request.setAttribute("doc", dto);
		request.setAttribute("promat", promat);
		
		// todo/read.jsp 로 forward
		request.getRequestDispatcher("/WEB-INF/information/Documents/정보_BOM문서관리_Read.jsp").forward(request, response);
	}

}
