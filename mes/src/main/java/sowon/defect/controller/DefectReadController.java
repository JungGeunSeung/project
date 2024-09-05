package sowon.defect.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.defect.dto.DefectDTO;
import sowon.defect.service.DefectService;


@WebServlet("/defect/read")
public class DefectReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DefectReadController doGet 실행");
    	String report_id = request.getParameter("report_id");
    	System.out.println(report_id);
        
        if(report_id != null) {
        	DefectService defectservice = new DefectService();
        	DefectDTO dto = defectservice.get(report_id);
            System.out.println(dto);
            
            request.setAttribute("dto", dto);

            
            request.getRequestDispatcher("/WEB-INF/불량기록_Defect_read.jsp").forward(request, response);
        } else {
            System.out.println("null");
        }
        
    }
}