package daol.equipment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daol.equipment.dao.EquipmentDAO;
import daol.equipment.dto.EquipmentDTO;
import daol.equipment.service.EquipmentService;

@WebServlet("/Equip")
public class EquipmentServlet extends HttpServlet {

	private EquipmentService equipmentService;

	@Override
	public void init() throws ServletException {
		this.equipmentService = new EquipmentService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		handleRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("changePageSize".equals(action)) {
			handlePagination(request, response); // 페이지 크기 변경 처리
		} else if ("searchByDate".equals(action)) {
			Date startDate = Date.valueOf(request.getParameter("startDate"));
			Date endDate = Date.valueOf(request.getParameter("endDate"));
			List<EquipmentDTO> equipmentList = equipmentService.getEquipmentByDateRange(startDate, endDate);
			request.setAttribute("equipmentList", equipmentList);
			request.getRequestDispatcher("/WEB-INF/equip/설비관리_설비고장_수리이력.jsp").forward(request, response);
		} else if ("deleteSelected".equals(action)) {
			// 선택된 항목 삭제 처리
			String[] selectedEquiIDs = request.getParameterValues("selectedEquiIDs");
			if (selectedEquiIDs != null) {
				for (String equiID : selectedEquiIDs) {
					equipmentService.deleteEquipment(equiID);
				}
			}
			response.sendRedirect("Equip");
		}
	}

	private void handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String equiID = request.getParameter("equiID");
		if (equiID != null && !equiID.isEmpty()) {
			try {
				EquipmentDTO equipment = equipmentService.getEquipmentById(equiID);
				if (equipment == null) {
					throw new NullPointerException("No equipment found with ID: " + equiID);
				}

				request.setAttribute("equipment", equipment);
				request.getRequestDispatcher("/WEB-INF/equip/EquipRead.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("/WEB-INF/equip/error.jsp").forward(request, response);
			}
		} else {
			handlePagination(request, response);
		}
	}

	private void handlePagination(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageNumber = 1;
		int pageSize = 10;
		String sortField = request.getParameter("sortField");
		String sortOrder = request.getParameter("sortOrder");

		String pageNumberParam = request.getParameter("pageNumber");
		String pageSizeParam = request.getParameter("pageSize");

		if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
			try {
				pageNumber = Integer.parseInt(pageNumberParam);
			} catch (NumberFormatException e) {
				pageNumber = 1;
			}
		}

		if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
			try {
				pageSize = Integer.parseInt(pageSizeParam);
			} catch (NumberFormatException e) {
				pageSize = 10;
			}
		}

		if (sortField == null || sortField.isEmpty()) {
			sortField = "equiID"; // 기본 정렬 필드 설정
		}

		if (sortOrder == null || sortOrder.isEmpty()) {
			sortOrder = "ASC"; // 기본 정렬 순서 설정
		}

		List<EquipmentDTO> equipmentList = equipmentService.getEquipmentByPage(pageSize, pageNumber, sortField,
				sortOrder);
		int totalEquipmentCount = equipmentService.getTotalEquipmentCount();

		request.setAttribute("equipmentList", equipmentList);
		System.out.println("equipmentList : " + equipmentList);
		request.setAttribute("totalPages", (int) Math.ceil((double) totalEquipmentCount / pageSize));
		request.setAttribute("sortField", sortField);
		request.setAttribute("sortOrder", sortOrder);
		request.getRequestDispatcher("/WEB-INF/equip/설비관리_설비고장_수리이력.jsp").forward(request, response);
	}
}
