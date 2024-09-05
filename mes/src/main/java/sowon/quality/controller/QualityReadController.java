package sowon.quality.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.QualityDTO;
import sowon.quality.service.QualityService;

@WebServlet("/quality/read")
public class QualityReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QualityReadController doGet 실행");
    	String ins_id = request.getParameter("ins_id");
    	System.out.println(ins_id);
        
        if(ins_id != null) {
            QualityService qualityservice = new QualityService();
            QualityDTO dto = qualityservice.get(ins_id);
            System.out.println(dto);
            
            request.setAttribute("dto", dto);

            
            request.getRequestDispatcher("/WEB-INF/품질기준_생산관리현황_Quality_read.jsp").forward(request, response);
        } else {
            System.out.println("null");
        }
        
    }
}