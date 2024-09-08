package geun.BOM.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import geun.BOM.service.EquipService;

@WebServlet("/Equip/deleteselect")
public class EquipDeleteSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Equip Delete Select Controller doPost 실행");

	    // 쉼표로 구분된 EquipIDs 파라미터 수신
	    String EquipIDsParam = request.getParameter("equipIDs");

	    if (EquipIDsParam != null && !EquipIDsParam.isEmpty()) {
	        // 쉼표로 구분된 문자열을 배열로 변환
	        String[] EquipIDArray = EquipIDsParam.split(",");

	        // 문자열 배열을 Integer 리스트로 변환
	        List EquipIDList = new ArrayList();
	        for (String id : EquipIDArray) {
	            try {
	                EquipIDList.add(id.trim());  // 문자열을 정수로 변환 후 리스트에 추가
	            } catch (NumberFormatException e) {
	                e.printStackTrace();  // 변환이 안 될 경우 예외 처리
	            }
	        }

	        System.out.println("받은 EquipID 리스트: " + EquipIDList);
	        
	        // 서비스에 정수 리스트 전달
	        EquipService service = new EquipService();
	        int dto = service.deleteSelect(EquipIDList);
	    }
	    
	    response.sendRedirect("list");
        
        
        
        
        
        
	}

}
