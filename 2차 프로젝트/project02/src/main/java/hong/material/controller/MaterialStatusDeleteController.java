package hong.material.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialStatusDTO;
import hong.material.service.MaterialStatusService;



@WebServlet("/msd")
public class MaterialStatusDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MaterialStatusDeleteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MaterialStatusService service = new MaterialStatusService();
		String[] prodnumlist2 = request.getParameterValues("prodnum");
		
		
		List<MaterialStatusDTO> dtolist = new ArrayList<MaterialStatusDTO>();
		
		
		for(int i = 0;i<prodnumlist2.length;i++) {
			MaterialStatusDTO dto = new MaterialStatusDTO();
			System.out.println("controller : " + prodnumlist2[i]);
			dto.setProdnum(prodnumlist2[i]);
			dtolist.add(dto);
		}
	
		service.delete(dtolist);
	}

}
