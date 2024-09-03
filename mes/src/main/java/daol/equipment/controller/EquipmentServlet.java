package daol.equipment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            EquipmentDTO equipment = new EquipmentDTO();
            equipment.setEquiID(request.getParameter("equiID"));
            equipment.setEquiname(request.getParameter("equiname"));
            equipment.setEquitype(request.getParameter("equitype"));
            equipment.setManager(request.getParameter("manager"));
            equipment.setMaindate(java.sql.Date.valueOf(request.getParameter("maindate")));
            equipment.setMaincontent(request.getParameter("maincontent"));

            equipmentService.addEquipment(equipment);
        } else if ("delete".equals(action)) {
            String equiID = request.getParameter("equiID");
            equipmentService.deleteEquipment(equiID);
        } else if ("update".equals(action)) {
            EquipmentDTO equipment = new EquipmentDTO();
            equipment.setEquiID(request.getParameter("equiID"));
            equipment.setEquiname(request.getParameter("equiname"));
            equipment.setEquitype(request.getParameter("equitype"));
            equipment.setManager(request.getParameter("manager"));
            equipment.setMaindate(java.sql.Date.valueOf(request.getParameter("maindate")));
            equipment.setMaincontent(request.getParameter("maincontent"));

            equipmentService.updateEquipment(equipment);
        } else if ("changePageSize".equals(action)) {
            handlePagination(request, response);
            return;
        }

        response.sendRedirect("Equip");
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    private void handlePagination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        List<EquipmentDTO> equipmentList = equipmentService.getEquipmentByPage(pageSize, pageNumber, sortField, sortOrder);
        int totalEquipmentCount = equipmentService.getTotalEquipmentCount();

        request.setAttribute("equipmentList", equipmentList);
        request.setAttribute("totalPages", (int) Math.ceil((double) totalEquipmentCount / pageSize));
        request.setAttribute("sortField", sortField);
        request.setAttribute("sortOrder", sortOrder);
        request.getRequestDispatcher("/WEB-INF/설비관리_설비고장_수리이력.jsp").forward(request, response);
    }
}
