package daol.equipment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daol.equipment.dto.NonOperHistoryDTO;
import daol.equipment.service.NonOperHistoryService;

@WebServlet("/non")
public class NonOperController extends HttpServlet {
    private NonOperHistoryService nonOperHistoryService;

    @Override
    public void init() throws ServletException {
        this.nonOperHistoryService = new NonOperHistoryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String resultID = (String) session.getAttribute("resultID");

        if (resultID == null) {
            resultID = nonOperHistoryService.getDefaultResultID();
        }

        // 추가: 페이지 번호와 페이지 크기를 쿼리 문자열 또는 기본값에서 얻기
        int pageSize = 10;  // 기본 페이지 크기
        int pageNumber = 1; // 기본 페이지 번호
        try {
            pageNumber = Integer.parseInt(request.getParameter("page"));
            pageSize = Integer.parseInt(request.getParameter("size"));
        } catch (NumberFormatException e) {
            // 쿼리 문자열에서 제공되지 않거나 형식이 잘못된 경우 기본값 사용
        }

        // 비운영 이력 리스트 가져오기 (페이징 적용)
        List<NonOperHistoryDTO> nonOperHistoryList = nonOperHistoryService.getNonOperHistoryByPage(pageSize, pageNumber, "RESULTID", "ASC");
        request.setAttribute("nonOperHistoryList", nonOperHistoryList);
        request.setAttribute("resultID", resultID);

        request.getRequestDispatcher("/WEB-INF/equip/설비관리_비가동이력.jsp").forward(request, response);
    }
    
}

