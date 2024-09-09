package daol.equipment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daol.equipment.dto.NonOperHistoryDTO;
import daol.equipment.service.NonOperHistoryService;

@WebServlet("/addNonOper")
public class NonOperHistoryAddController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        // JSP 페이지로 포워딩 (비가동 이력을 추가하는 폼으로 이동)
        request.getRequestDispatcher("/WEB-INF/equip/addnonoper.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8;");
        
        // 폼에서 입력받은 값들을 파라미터로 받아온다
        String resultID = request.getParameter("resultID");
        String equiID = request.getParameter("equiID");
        String equiName = request.getParameter("equiName");
        String downtimeHistory = request.getParameter("downtimeHistory");
        String downReason = request.getParameter("downReason");


        // 비가동 이력 DTO 객체 생성 및 데이터 설정
        NonOperHistoryDTO nonOperHistory = new NonOperHistoryDTO();
        nonOperHistory.setEquiID(equiID);
        nonOperHistory.setEquiName(equiName);
        nonOperHistory.setDowntimeHistory(downtimeHistory);
        nonOperHistory.setDownReason(downReason);

        // 서비스 객체를 사용하여 비가동 이력 추가 처리
        NonOperHistoryService nonOperHistoryService = new NonOperHistoryService();
        nonOperHistoryService.addNonOperHistory(nonOperHistory);

        // 비가동 이력 목록 페이지로 리다이렉트
        response.sendRedirect("/WEB-INF/equip/설비관리_비가동이력.jsp");
    }
}
