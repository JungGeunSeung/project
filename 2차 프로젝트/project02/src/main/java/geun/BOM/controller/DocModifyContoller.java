package geun.BOM.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.DocumentDTO;
import geun.BOM.service.Doc_Service;



@WebServlet("/doc/modify")
public class DocModifyContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        System.out.println("Doc Modify Contoller doGet 실행");
		
        String docID = request.getParameter("document_id");
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String created_date = request.getParameter("created_date");
		String updated_date = request.getParameter("updated_date");
		String version = request.getParameter("version");
		
		DocumentDTO dto = new DocumentDTO();
		dto.setDocument_id(Integer.parseInt(docID));
		dto.setUserid(userid);
		dto.setTitle(title);
		dto.setContent(content);
		try {
			SimpleDateFormat created_date2 = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDate = created_date2.parse(created_date);
	        java.sql.Date created_date_sql = new java.sql.Date(utilDate.getTime());
			dto.setCreated_date(created_date_sql);
			
			SimpleDateFormat updated_date2 = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDate2 = updated_date2.parse(updated_date);
	        
	        java.sql.Date updated_date_sql = new java.sql.Date(utilDate2.getTime());
			
			dto.setUpdated_date(updated_date_sql);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setVersion(Integer.parseInt(version));
		
		request.setAttribute("doc", dto);
		
		
		request.getRequestDispatcher("/WEB-INF/information/Documents/정보_BOM문서관리_modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		System.out.println("Doc Modify Contoller doPost 실행");
		
		String docID = request.getParameter("document_id");
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String created_date = request.getParameter("created_date");
		String updated_date = request.getParameter("updated_date");
		String version = request.getParameter("version");
		
		DocumentDTO dto = new DocumentDTO();
		dto.setDocument_id(Integer.parseInt(docID.trim()));
		dto.setUserid(userid);
		dto.setTitle(title);
		dto.setContent(content);
		try {
			SimpleDateFormat created_date2 = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDate = created_date2.parse(created_date);
	        java.sql.Date created_date_sql = new java.sql.Date(utilDate.getTime());
			dto.setCreated_date(created_date_sql);
			
			SimpleDateFormat updated_date2 = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date utilDate2 = updated_date2.parse(updated_date);
	        
	        java.sql.Date updated_date_sql = new java.sql.Date(utilDate2.getTime());
			
			dto.setUpdated_date(updated_date_sql);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setVersion(Integer.parseInt(version));
		
		Doc_Service service = new Doc_Service();
		int result = service.update(dto);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/doc/list");
	}

}
