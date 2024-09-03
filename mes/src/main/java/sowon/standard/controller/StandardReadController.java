package sowon.standard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.standard.dto.StandardDTO;
import sowon.standard.service.StandardService;

@WebServlet("/standard/read")
public class StandardReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("QualityReadController doGet 실행");
    	String ins_id = request.getParameter("quality_id ");
    	System.out.println(quality_id );
        // 파라메터가 널이 아닐경우 처리
        if(quality_id  != null) {
            StandardService standardservice = new StandardService();
            StandardDTO dto = standardservice.get(quality_id );
            System.out.println(dto);
            // 요청하는 곳에 키와 벨류로 저장
            request.setAttribute("dto", dto);

            // todo/read.jsp 로 forward
            request.getRequestDispatcher("/WEB-INF/시험항목_Standard_modify.jsp").forward(request, response);
        } else {
            System.out.println("null");
        }
    }
}