package sowon.quality.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sowon.quality.dto.QualityDTO;
import sowon.quality.service.QualityService;

@WebServlet("/quality/read")
public class QualityReadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tno2 = request.getParameter("tno");

        // 파라메터가 널이 아닐경우 처리
        if(tno2 != null) {
            QualityService qualityservice = new QualityService();
            QualityDTO dto = qualityservice.get(tno2);

            // 요청하는 곳에 키와 벨류로 저장
            request.setAttribute("dto", dto);

            // todo/read.jsp 로 forward
            request.getRequestDispatcher("/WEB-INF/품질관리_Quality_read.jsp").forward(request, response);
        } else {
            System.out.println("null");
        }
    }
}