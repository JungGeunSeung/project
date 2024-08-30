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
		String tno2 = request.getParameter("tno");
		
		String tno = "";
		
		// 파라메터가 널이 아닐경우 숫자로 변환 (String to int)
		if(tno2 != null) {
			tno = tno2;
		} else {
			System.out.println("null");
		}
		
		// TodoService를 호출하여 TodoDTO타입의 메소드를 호출하여 dto변수에 저장
		QualityService qualityservice = new QualityService();
		QualityDTO dto = qualityservice.get(tno);
		
		// 요청하는 곳에 키와 벨류로 저장
		request.setAttribute("dto", dto);
		
		// todo/read.jsp 로 forward
		request.getRequestDispatcher("/WEB-INF/quality/read.jsp").forward(request, response);
	}

}
