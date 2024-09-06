package geun.BOM.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.EquipmentDTO;
import geun.BOM.service.EquipService;

@WebServlet("/Equip/create")
public class EquipCreateContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		System.out.println("Equip Create Contoller doGet 실행");
		
		request.getRequestDispatcher("/WEB-INF/information/facility/정보_설비코드_Create.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		System.out.println("Equip Create Contoller doPost 실행");
		
		String equiID = request.getParameter("equiID");
		String equiName = request.getParameter("equiName");
		String equiImg = request.getParameter("equiImg");
		String equiType = request.getParameter("equiType");
		String equiDesc = request.getParameter("equiDesc");
		String sellDate = request.getParameter("sellDate");
		String equiLoc = request.getParameter("equiLoc");
		String status = request.getParameter("status");
		
		EquipmentDTO dto = new EquipmentDTO();
		
		dto.setEquiID(equiID);
		dto.setEquiname(equiName);
		dto.setEquiImg(equiImg);
		dto.setEquiType(equiType);
		dto.setEquiDesc(equiDesc);
		dto.setSellDate(java.sql.Date.valueOf(sellDate));  // sellDate는 String에서 Date로 변환하여 설정
		dto.setEquiLoc(equiLoc);
		dto.setStatus(status);
		
		// DB 의 insert까지 실행하여 가져와 담는다.
		EquipService service = new EquipService();
		int result = service.register(dto);
		
		// list 목록으로 보내기
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/Equip/list");
	}

}
