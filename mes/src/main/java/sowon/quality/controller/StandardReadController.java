package sowon.quality.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.StandardDTO;
import sowon.quality.service.StandardService;

@WebServlet("/standard/read")
public class StandardReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	String quality_id = request.getParameter("quality_id ");
    	System.out.println(quality_id );
       
        if(quality_id  != null) {
            StandardService standardservice = new StandardService();
            StandardDTO dto = standardservice.get(quality_id );
            System.out.println(dto);
            
            request.setAttribute("dto", dto);

            
            request.getRequestDispatcher("/WEB-INF/quality/standard/품질기준_Standard_modify.jsp").forward(request, response);
        } else {
            System.out.println("null");
        }
    }
}