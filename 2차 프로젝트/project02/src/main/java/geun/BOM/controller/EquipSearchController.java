package geun.BOM.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.EquipService;


@WebServlet("/Equip/list/search")
public class EquipSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Equip Search Controller doGet 실행");

        String equiname = request.getParameter("equiname");
        
        System.out.println("equiname : "+equiname);
        EquipService service = new EquipService();
        List list = service.getEquip(equiname);
        System.out.println("list : " + list);
        request.setAttribute("Equip", list);
        
        request.getRequestDispatcher("/WEB-INF/information/facility/정보_설비코드_search.jsp").forward(request, response);
	
	}

}
