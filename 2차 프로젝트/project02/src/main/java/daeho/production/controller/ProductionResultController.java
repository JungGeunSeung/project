package daeho.production.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import daeho.production.dto.ProductionResultDTO;
import daeho.production.service.ProductionResultService;



/**
 * Servlet implementation class ProductionResultController
 */
@WebServlet("/productionresult")
public class ProductionResultController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductionResultService productionService;

    // 데이터 소스를 얻기 위한 메서드
    private DataSource getDataSource() throws Exception {
        Context ctx = new InitialContext(); // JNDI를 통해 컨텍스트를 초기화
        return (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle"); // 리소스 이름으로 데이터소스 찾기
    }

    // 서블릿 초기화 시 데이터베이스 연결 및 서비스 초기화
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // 데이터베이스 연결 설정
            Context ctx = new InitialContext();
            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
            Connection conn = dataSource.getConnection(); // 여기에서 SQLException이 발생할 수 있음
            System.out.println(conn + "생산실적 컨트롤러에서 데이터베이스 연결");
            
            // 서비스 초기화
            productionService = new ProductionResultService(conn);
        } catch (NamingException e) {
            e.printStackTrace(); // NamingException 처리
            throw new ServletException("JNDI 오류 발생", e); // 서블릿 예외로 감싸서 던짐
        } catch (SQLException e) {
            e.printStackTrace(); // SQLException 처리
            throw new ServletException("DB 연결 중 오류 발생", e); // 서블릿 예외로 감싸서 던짐
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        
        String action = request.getParameter("action");
        try {
            if (action == null || action.equals("list")) {
                // 모든 생산 결과 조회 및 JSP로 전달
                List<ProductionResultDTO> results = productionService.getAllResults();
                request.setAttribute("results", results);
                request.getRequestDispatcher("/WEB-INF/생산관리_생산실적.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                // 특정 생산 결과 조회 및 수정 페이지로 전달
                String resultID = request.getParameter("resultID");
                ProductionResultDTO result = productionService.getResultById(resultID);
                request.setAttribute("result", result);
                request.getRequestDispatcher("/WEB-INF/productionEdit.jsp").forward(request, response);
            } else if (action.equals("delete")) {
                // 특정 생산 결과 삭제
                String resultID = request.getParameter("resultID");
                productionService.deleteResult(resultID);

                String productEn = URLEncoder.encode("productionresult", "UTF-8");
                response.sendRedirect(productEn + "?action=list");
            }
        } catch (SQLException e) {
            throw new ServletException("DB 처리 중 오류 발생", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        try {
            if (action.equals("insert")) {
                // 새로운 생산 결과 추가
                ProductionResultDTO result = new ProductionResultDTO(
                    request.getParameter("resultID"),
                    request.getParameter("productionID"),
                    request.getParameter("taskID"),
                    request.getParameter("planID"),
                    request.getParameter("productionDate"),
                    Integer.parseInt(request.getParameter("producedQuantity")),
                    Integer.parseInt(request.getParameter("defectiveQuantity")),
                    request.getParameter("status")
                );
                productionService.insertResult(result);
            } else if (action.equals("update")) {
                // 기존 생산 결과 업데이트
                ProductionResultDTO result = new ProductionResultDTO(
                    request.getParameter("resultID"),
                    request.getParameter("productionID"),
                    request.getParameter("taskID"),
                    request.getParameter("planID"),
                    request.getParameter("productionDate"),
                    Integer.parseInt(request.getParameter("producedQuantity")),
                    Integer.parseInt(request.getParameter("defectiveQuantity")),
                    request.getParameter("status")
                );
                productionService.updateResult(result);
            }
            String productEn = URLEncoder.encode("productionresult", "UTF-8");
            response.sendRedirect(productEn + "?action=list");
        } catch (SQLException e) {
            throw new ServletException("DB 처리 중 오류 발생", e);
        }
    }
}
