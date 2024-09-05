package sowon.defect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.defect.dto.DefectDTO;
import sowon.defect.service.DefectService;


@WebServlet("/defect/modify")
public class DefectModityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        
        String report_id = request.getParameter("report_id");
		String ins_id = request.getParameter("ins_id");
		String production_id = request.getParameter("production_id");
		String planid2 = request.getParameter("planid");
		String defect_count = request.getParameter("defect_count");
		
		DefectDTO dto = new DefectDTO();
		dto.setReport_id( report_id );
		dto.setIns_id(ins_id);
		dto.setProduction_id(production_id);
		dto.setPlanid(planid2);
		dto.setDefect_count(Integer.parseInt(defect_count));
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/불량기록_Defect_modify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		
		
		String report_id = request.getParameter("report_id");
		String ins_id = request.getParameter("ins_id");
		String production_id = request.getParameter("production_id");
		String planid2 = request.getParameter("planid");
		String defect_count = request.getParameter("defect_count");
		
		DefectDTO dto = new DefectDTO();
		dto.setReport_id( report_id );
		dto.setIns_id(ins_id);
		dto.setProduction_id(production_id);
		dto.setPlanid(planid2);
		dto.setDefect_count(Integer.parseInt(defect_count));
	
		System.out.println(dto);
		
		DefectService service = new DefectService();
		int result1 = service.update(dto);
		System.out.println("insert 결과 :"+ result1);
		System.out.println("update 결과 :" + result1);
		System.out.println("delete 결과 :" + result1);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/defect/list");

	}

}
