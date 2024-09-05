package sowon.defect.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.defect.service.DefectService;


@WebServlet("/defect/list/search")
public class DefectSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("DefectSearchController doGet 실행");

        String report_id = request.getParameter("report_id");
        System.out.println(report_id);
        DefectService service = new DefectService();
        List list = service.getDefect(report_id);

        request.setAttribute("defect", list);
        
        request.getRequestDispatcher("/WEB-INF/불량기록_Defect_search.jsp").forward(request, response);
    } 
}
