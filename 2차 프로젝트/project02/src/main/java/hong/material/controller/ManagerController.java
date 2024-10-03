package hong.material.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialStatusDTO;
import hong.material.dto.UserDTO;
import hong.material.service.LoginService;
import hong.material.service.MaterialStatusService;

/**
 * Servlet implementation class ManagerController
 */
@WebServlet("/manager")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginService service = new LoginService();
		List<UserDTO> list = service.allList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/mainLogin/관리자.jsp").forward(request, response);
	}

	

}
