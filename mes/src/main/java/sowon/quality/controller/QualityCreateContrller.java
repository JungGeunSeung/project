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


@WebServlet("/quality/create")
public class QualityCreateContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		request.getRequestDispatcher("/WEB-INF/생산검사현황_Quality_register.jsp").forward(request, response);
	}

    public void setDefect_count(int count) {
        // 기존 로직
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		String ins_id = request.getParameter("ins_id");
		String production_id = request.getParameter("production_id");
		String planid2 = request.getParameter("planid");
		String ins_date = request.getParameter("ins_date");
		String result = request.getParameter("result");
		String defect_count = request.getParameter("defect_count");
		String defect_cause = request.getParameter("defect_cause");
		String resultid = request.getParameter("resultid");
		String taskid = request.getParameter("taskid");
		String finished = request.getParameter("finished");
		
		LocalDate parsedInsDate = null;
		if (ins_date != null && !ins_date.isEmpty()) {
		    parsedInsDate = LocalDate.parse(ins_date);
		}
		
		QualityDTO dto = new QualityDTO();
		dto.setIns_id(ins_id);
		dto.setProduction_id(production_id);
		dto.setPlanid(planid2);
		dto.setIns_Date(parsedInsDate);
		dto.setResult( result );
		dto.setDefect_count(Integer.parseInt(defect_count));
		dto.setDefect_cause( defect_cause );
		dto.setResultID( resultid );
		dto.setTaskid( taskid );
	
		// DB 의 insert까지 실행하여 가져와 담는다.
		QualityService service = new QualityService();
		int result1 = service.register(dto);
		System.out.println("insert 결과 :"+ result1);
		
		// list 목록으로 보내기
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/quality");
	}
	
}
