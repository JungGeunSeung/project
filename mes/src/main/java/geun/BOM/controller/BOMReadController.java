package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.dto.BOM_DTO;
import geun.BOM.service.BOM_Service;

@WebServlet("/BOM/read")
public class BOMReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BOMReadController doGet 실행");
		// 요청받은 파라메터를 변수에 저장
		String bom_id = request.getParameter("bom_id");
		String production_id = request.getParameter("production_id");
		
		String bomid2 = null;
		// 파라메터가 널이 아닐경우 숫자로 변환 (String to int)
		if(bom_id != null) {
			bomid2 = bom_id;
		} else {
			System.out.println("bomid : " + "null");
		}
		
		// TodoService를 호출하여 TodoDTO타입의 메소드를 호출하여 dto변수에 저장
		BOM_Service service = new BOM_Service();
		BOM_DTO dto = service.get(bomid2);
		
		List promat = service.selectProduct(production_id);
		System.out.println(promat);
		
		// 요청하는 곳에 키와 벨류로 저장
		request.setAttribute("bom", dto);
		request.setAttribute("promat", promat);
		
		// todo/read.jsp 로 forward
		request.getRequestDispatcher("/WEB-INF/정보_BOM_Read.jsp").forward(request, response);
	}

}
