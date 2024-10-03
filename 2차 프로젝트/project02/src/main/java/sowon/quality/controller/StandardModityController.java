package sowon.quality.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.StandardDTO;
import sowon.quality.service.StandardService;


@WebServlet("/standard/modify")
public class StandardModityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        
        String quality_id = request.getParameter("quality_id");
		String title = request.getParameter("title");
		String mgr = request.getParameter("mgr");
		String insti = request.getParameter("insti");
		String revision = request.getParameter("revision");
		System.out.println(quality_id + ", "+ title+ ", "+ mgr+ ", "+ insti+ ", "+ revision);
		
		LocalDate parsedRevision = null;
		if (revision != null && !revision.isEmpty()) {
			parsedRevision = LocalDate.parse(revision);
		}
		StandardDTO dto = new StandardDTO();
		 dto.setQuality_id(quality_id);
		 dto.setTitle(title);
		 dto.setMgr(mgr);
		 dto.setInsti(insti);
		 dto.setRevision(parsedRevision);
	
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/quality/standard/품질기준_Standard_modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		
		
		String quality_id = request.getParameter("quality_id");
		String title = request.getParameter("title");
		String mgr = request.getParameter("mgr");
		String insti = request.getParameter("insti");
		String revision = request.getParameter("revision");
		LocalDate parsedRevision = null;

		if (revision != null && !revision.isEmpty()) {
			parsedRevision = LocalDate.parse(revision);
		}
		StandardDTO dto = new StandardDTO();
		dto.setQuality_id(quality_id);
		dto.setTitle(title);
		dto.setMgr( mgr );
		dto.setInsti( insti );
		dto.setRevision(parsedRevision);
		
		System.out.println(dto);
		
		StandardService service = new StandardService();
		int result1 = service.update(dto);
		System.out.println("insert 결과 :"+ result1);
		System.out.println("update 결과 :" + result1);
		System.out.println("delete 결과 :" + result1);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/standard/list");

	}

}
