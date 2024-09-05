package sowon.quality.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.service.QualityService;

@WebServlet("/quality/list/search")
public class QualitySearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("QualitySearchController doGet 실행");

        String production_id = request.getParameter("production_id");
        System.out.println(production_id);
        QualityService service = new QualityService();
        List list = service.getQuality(production_id);

        request.setAttribute("quality", list);
        
        request.getRequestDispatcher("/WEB-INF/품질기준_생산관리현황_Quality_search.jsp").forward(request, response);
    } 
}
