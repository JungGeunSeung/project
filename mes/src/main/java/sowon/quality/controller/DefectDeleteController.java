package sowon.quality.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.BOM_Service;
import sowon.quality.service.DefectService;


@WebServlet("/defect/delete")
public class DefectDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DefectDeleteController doPost 실행");
        
	    String report_id = request.getParameter("report_id");
		
	    DefectService service = new DefectService();
		int dto = service.delete(report_id);
		
		response.sendRedirect("list");
		
       
    }
}

