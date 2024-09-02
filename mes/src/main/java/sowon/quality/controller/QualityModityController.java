package sowon.quality.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.QualityDTO;
import sowon.quality.service.QualityService;


@WebServlet("/quality/modify")
public class QualityModityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        
		String ins_id = request.getParameter("ins_id");
		String production_id = request.getParameter("production_id");
		String planid = request.getParameter("planid");
		String ins_date = request.getParameter("ins_date");
		String result = request.getParameter("result");
		String defect_count = request.getParameter("defect_count");
		String defect_cause = request.getParameter("defect_cause");
		String resultid = request.getParameter("resultID");
		String taskid = request.getParameter("taskid");
		System.out.println(ins_id + ", "+ production_id+ ", "+ planid+ ", "+ ins_date+ ", "+ result);
		System.out.println(defect_count + ", "+ defect_cause+ ", "+ resultid+ ", "+ taskid);
		LocalDate parsedInsDate = null;
		if (ins_date != null && !ins_date.isEmpty()) {
		    parsedInsDate = LocalDate.parse(ins_date);
		}
		QualityDTO dto = new QualityDTO();
		dto.setIns_id(ins_id);
		dto.setProduction_id(production_id);
		dto.setPlanid(planid);
		dto.setIns_Date(parsedInsDate);
		dto.setResult( result );
		dto.setDefect_count(Integer.parseInt(defect_count));
		dto.setDefect_cause( defect_cause );
		dto.setResultID( resultid );
		dto.setTaskid( taskid );
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/품질관리_Quality_modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		
		
		String ins_id = request.getParameter("ins_id");
		String production_id = request.getParameter("production_id");
		String planid = request.getParameter("planid");
		String ins_date = request.getParameter("ins_date");
		String result = request.getParameter("result");
		String defect_count = request.getParameter("defect_count");
		String defect_cause = request.getParameter("defect_cause");
		String resultid = request.getParameter("resultid");
		String taskid = request.getParameter("taskid");
		LocalDate parsedInsDate = null;
		
		if (ins_date != null && !ins_date.isEmpty()) {
		    parsedInsDate = LocalDate.parse(ins_date);
		}
		
		QualityDTO dto = new QualityDTO();
		dto.setIns_id(ins_id);
		dto.setProduction_id(production_id);
		dto.setPlanid(planid);
		dto.setIns_Date(parsedInsDate);
		dto.setResult( result );
		dto.setDefect_count(Integer.parseInt(defect_count));
		dto.setDefect_cause( defect_cause );
		dto.setResultID( resultid );
		dto.setTaskid( taskid );
	
		System.out.println(dto);
		
		QualityService service = new QualityService();
		int result1 = service.update(dto);
		System.out.println("insert 결과 :"+ result);
		System.out.println("update 결과 :" + result);
		System.out.println("delete 결과 :" + result);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/quality");

	}

}
