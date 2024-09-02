package sowon.quality.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import sowon.quality.service.QualityService;

@WebServlet("/quality/delete")
public class QualityDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QualityDeleteController doPost 실행");
        
	    String ins_id = request.getParameter("ins_id");
		
		QualityService service = new QualityService();
		int dto = service.delete(ins_id);
		
		response.sendRedirect("list");
		
       
    }
}
