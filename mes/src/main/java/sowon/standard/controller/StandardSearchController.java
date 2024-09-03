package sowon.standard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.standard.service.StandardService;

@WebServlet("/quality/list/search")
public class StandardSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("StandardearchController doGet 실행");

        String production_id = request.getParameter("quality_id");
        System.out.println(production_id);
        StandardService service = new StandardService();
        List list = service.getQuality(production_id);

        request.setAttribute("standard", list);
        
        request.getRequestDispatcher("/WEB-INF/시험항목_Standard_register.jsp").forward(request, response);
    } 
}
