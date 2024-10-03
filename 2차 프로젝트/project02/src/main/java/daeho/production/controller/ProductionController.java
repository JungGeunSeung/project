package daeho.production.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daeho.production.dto.ProductionPlanDTO;
import daeho.production.service.ProductionPlanService;



@WebServlet("/production")
public class ProductionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ProductionPlanService service = new ProductionPlanService();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("production/list doGet실행");

		//한 페이지당 개수
		String countPerPage = request.getParameter("countPerPage");
		//현재 페이지
		String page = request.getParameter("page");
		
		//혹시 받은게 없다면 기본값 세팅
		if(countPerPage == null)countPerPage = "10";
		if(page == null)page = "1";
		

		ProductionPlanService empPageService = new ProductionPlanService();
		Map map = empPageService.getservicePage(countPerPage, page);
	
		request.setAttribute("map", map);
		request.setAttribute("countPerPage", countPerPage);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("/WEB-INF/생산관리_생산계획목록.jsp").forward(request, response);
		
//		String action = request.getParameter("action");
//		try {
//			if(action ==null || action.equals("생산계획목록")){
//				
//				request.setAttribute("map", map);
//				request.setAttribute("countPerPage", countPerPage);
//				request.setAttribute("page", page);
//				
//				request.getRequestDispatcher("/WEB-INF/생산관리_생산계획목록.jsp").forward(request, response);
//			
//			}else if(action.equals("delete")) {
//				String planid = request.getParameter("planid");
//				ProductionPlanDAO planDAO = new ProductionPlanDAO();
//				planDAO.deletePlan(planid);
//	            response.sendRedirect("생산계획목록");
//	            
//	            
//			}
//		}catch (Exception e) {
//            e.printStackTrace(); // 예외 발생 시 오류 출력
//        }
		
		
		String action = request.getParameter("action");

        if ("getPlanById".equals(action)) {
            String planid = request.getParameter("planid");
            ProductionPlanDTO plan = service.getPlanById(planid);

            // JSON 형식으로 응답 반환
            response.setContentType("application/json");
//            response.getWriter().write(new Gson().toJson(plan));
        } else {
            // 기존 목록 조회 로직
            displayPlanList(request, response);
        }
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // 새로운 계획 추가 로직
            String production_id = request.getParameter("production_id");
            int plannedQuan = Integer.parseInt(request.getParameter("plannedQuan"));
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            String status = request.getParameter("status");
            String userid = request.getParameter("userid");

            ProductionPlanDTO newPlan = new ProductionPlanDTO();
            service.addPlan(newPlan);
        } else if ("edit".equals(action)) {
            // 기존 계획 수정 로직
            String planid = request.getParameter("planid");
            String production_id = request.getParameter("production_id");
            int plannedQuan = Integer.parseInt(request.getParameter("plannedQuan"));
            Date startDate = Date.valueOf(request.getParameter("startDate"));
            Date endDate = Date.valueOf(request.getParameter("endDate"));
            String status = request.getParameter("status");
            String userid = request.getParameter("userid");

            ProductionPlanDTO updatedPlan = new ProductionPlanDTO();
            service.updatePlan(updatedPlan);
        }

        // 처리 완료 후 목록 페이지로 리다이렉트
        response.sendRedirect("/production");
    }

    private void displayPlanList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 목록 조회 로직
    }




}
