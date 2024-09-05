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

import geun.BOM.service.Doc_Service;

@WebServlet("/doc/delete/select")
public class DocDeleteSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Doc Delete Select Controller doPost 실행");

	    // 쉼표로 구분된 docIDs 파라미터 수신
	    String docIDsParam = request.getParameter("docIDs");

	    if (docIDsParam != null && !docIDsParam.isEmpty()) {
	        // 쉼표로 구분된 문자열을 배열로 변환
	        String[] docIDArray = docIDsParam.split(",");

	        // 문자열 배열을 Integer 리스트로 변환
	        List<Integer> docIDList = new ArrayList<>();
	        for (String id : docIDArray) {
	            try {
	                docIDList.add(Integer.parseInt(id.trim()));  // 문자열을 정수로 변환 후 리스트에 추가
	            } catch (NumberFormatException e) {
	                e.printStackTrace();  // 변환이 안 될 경우 예외 처리
	            }
	        }

	        System.out.println("받은 docID 리스트: " + docIDList);
	        
	        // 서비스에 정수 리스트 전달
	        Doc_Service service = new Doc_Service();
	        int dto = service.deleteSelect(docIDList);
	    }
	    
	    response.sendRedirect("list");
        
        
        
        
        
        
	}

}
