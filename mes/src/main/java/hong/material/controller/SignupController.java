package hong.material.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.SignupDTO;
import hong.material.service.SignupService;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/mainLogin/signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SignupService service = new SignupService();
		SignupDTO dto = new SignupDTO();
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("full_phone");
		Date birth = Date.valueOf(request.getParameter("birth"));
		System.out.println("controller name : " + name);
		System.out.println("phone : " + phone);
		
		
		dto.setName(name);
		dto.setId(id);
		dto.setPw(pw);
		dto.setEmail(email);
		dto.setPhonenum(phone);
		dto.setBirth(birth);
		
		service.signup(dto);
		response.sendRedirect("login");
	}

}
