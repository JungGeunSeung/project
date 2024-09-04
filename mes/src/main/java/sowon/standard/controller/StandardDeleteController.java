package sowon.standard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.standard.service.StandardService;

@WebServlet("/standard/delete")
public class StandardDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	    String quality_id = request.getParameter("quality_id");
		
	    StandardService service = new StandardService();
		int dto = service.delete(quality_id);
		
		response.sendRedirect("list");
		
       
    }
}
