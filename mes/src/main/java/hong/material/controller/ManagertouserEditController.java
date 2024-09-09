package hong.material.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.UserDTO;
import hong.material.service.LoginService;

/**
 * Servlet implementation class ManagertouserEditController
 */
@WebServlet("/manageredit")
public class ManagertouserEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginService service = new LoginService();
		String str = request.getParameter("userid");
		UserDTO dto = service.print(str);
		System.out.println("manageredit controller 확인");

		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/mainLogin/edituser.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8;");
		LoginService service = new LoginService();
		UserDTO dto = new UserDTO();
		dto.setUserid(request.getParameter("userid"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utildate = format.parse(request.getParameter("birth"));
			java.sql.Date date = new java.sql.Date(utildate.getTime());
			dto.setBirth(date);
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utildate = format.parse(request.getParameter("hire"));
			java.sql.Date date = new java.sql.Date(utildate.getTime());
			dto.setHire(date);
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("grade"));
		dto.setGrade(request.getParameter("grade"));
		dto.setStatus(request.getParameter("status"));
		dto.setEmpno(Integer.parseInt(request.getParameter("empno")));
		dto.setDeptno(Integer.parseInt(request.getParameter("deptno")));
		
		
		service.update(dto);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/WEB-INF/material/update.jsp").forward(request, response);
	}

}
