package hong.material.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hong.material.dto.MaterialDTO;
import hong.material.service.MaterialService;

@WebServlet("/materialdelete")
public class MaterialDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("delete 호출");
		MaterialService service = new MaterialService();
		String[] inoutlist2 = request.getParameterValues("inout");
		String[] inumlist2 = request.getParameterValues("inum");
		String[] prodnumlist2 = request.getParameterValues("prodnum");
		String[] countlist2 = request.getParameterValues("count");
		
		
		List<MaterialDTO> dtolist = new ArrayList<MaterialDTO>();
		
		
		for(int i = 0;i<inoutlist2.length;i++) {
			MaterialDTO dto = new MaterialDTO();
			dto.setInout(inoutlist2[i]);
			dto.setnum(Integer.parseInt(inumlist2[i]));
			dto.setprodNum(prodnumlist2[i]);
			dto.setCnt(Integer.parseInt(countlist2[i]));
			dtolist.add(dto);
		}
	
		service.delete(dtolist);
	}

}
