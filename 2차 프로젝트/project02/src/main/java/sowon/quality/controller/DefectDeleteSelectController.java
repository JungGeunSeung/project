package sowon.quality.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.service.DefectService;




@WebServlet("/Defect/deleteSelect")
public class DefectDeleteSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doc Delete Select Controller doPost 실행");

	    // 쉼표로 구분된 docIDs 파라미터 수신
	    String deIDsParam = request.getParameter("deIDs");

	    if (deIDsParam != null && !deIDsParam.isEmpty()) {
	        // 쉼표로 구분된 문자열을 배열로 변환
	        String[] deIDArray = deIDsParam.split(",");

	        // 문자열 배열을 Integer 리스트로 변환
	        List<String> deIDList = new ArrayList<>();
	        for (String id : deIDArray) {
	        	deIDList.add(id.trim());  // 문자열을 정수로 변환 후 리스트에 추가
	        }

	        System.out.println("받은 docID 리스트: " + deIDList);
	        
	        // 서비스에 정수 리스트 전달
	        DefectService service = new DefectService();
	        int dto = service.deleteSelect(deIDList);
	    }
	    
	    response.sendRedirect("list");
        
        
        
        
        
        
	}

}
