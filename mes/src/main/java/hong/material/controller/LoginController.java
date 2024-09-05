package hong.material.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hong.material.dto.UserDTO;
import hong.material.service.LoginService;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginService service = new LoginService();
		
		
		UserDTO dto = service.login(id, pw);
		
		if(dto != null) {
			HttpSession session = request.getSession();//유저 정보를 세션으로 넘기기
			session.setAttribute("user", dto);
			response.sendRedirect("main");
		}
		else {
			 response.sendRedirect("login.jsp?error=true"); // 인증 실패 시 로그인 페이지로 리디렉션
		}
	}
}
