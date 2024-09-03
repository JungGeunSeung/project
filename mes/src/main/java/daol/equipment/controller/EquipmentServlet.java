package daol.equipment.controller;

import daol.equipment.dto.EquipmentDTO;
import daol.equipment.service.EquipmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Equip")
public class EquipmentServlet extends HttpServlet {

    private EquipmentService equipmentService;

    @Override
    public void init() throws ServletException {
        this.equipmentService = new EquipmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNumber = 1;
        int pageSize = 10;

        String pageNumberParam = request.getParameter("pageNumber");
        String pageSizeParam = request.getParameter("pageSize");

        if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
            pageNumber = Integer.parseInt(pageNumberParam);
        }

        if (pageSizeParam != null && !pageSizeParam.isEmpty()) {
            pageSize = Integer.parseInt(pageSizeParam);
        }

        List<EquipmentDTO> equipmentList = equipmentService.getEquipmentByPage(pageSize, pageNumber);
        int totalEquipmentCount = equipmentService.getTotalEquipmentCount();

        request.setAttribute("equipmentList", equipmentList);
        request.setAttribute("totalPages", (int) Math.ceil((double) totalEquipmentCount / pageSize));
        request.getRequestDispatcher("/WEB-INF/설비관리_설비고장_수리이력.jsp").forward(request, response);
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
        }

        response.sendRedirect("Equip");
    }
}
