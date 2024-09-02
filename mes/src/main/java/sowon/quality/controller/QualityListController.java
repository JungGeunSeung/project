package sowon.quality.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.QualityDTO;
import sowon.quality.service.QualityService;

@WebServlet("/quality")
public class QualityListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		QualityService service = new QualityService();
		List<QualityDTO> list = service.getList();
		System.out.println(list);
		request.setAttribute("list1", list);
		
		
		request.getRequestDispatcher("/WEB-INF/품질관리_시험항목_품질기준.jsp").forward(request, response);
		
	}

}
