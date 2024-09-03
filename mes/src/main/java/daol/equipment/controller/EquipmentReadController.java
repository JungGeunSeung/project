package daol.equipment.controller;

import daol.equipment.dto.EquipmentDTO;
import daol.equipment.service.EquipmentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EquipRead")
public class EquipmentReadController extends HttpServlet {

    private EquipmentService equipmentService;

    @Override
    public void init() throws ServletException {
        this.equipmentService = new EquipmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int equiID = Integer.parseInt(request.getParameter("equiID"));
        EquipmentDTO equipment = equipmentService.getEquipmentById(equiID);

        request.setAttribute("equipment", equipment);
        request.getRequestDispatcher("/WEB-INF/EquipRead.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            EquipmentDTO equipment = new EquipmentDTO();
            equipment.setEquiID(request.getParameter("equiID"));
            equipment.setEquiname(request.getParameter("equiname"));
            equipment.setEquitype(request.getParameter("equitype"));
            equipment.setManager(request.getParameter("manager"));
            equipment.setMaindate(java.sql.Date.valueOf(request.getParameter("maindate")));
            equipment.setMaincontent(request.getParameter("maincontent"));

            equipmentService.updateEquipment(equipment);
        } else if ("add".equals(action)) {
            EquipmentDTO equipment = new EquipmentDTO();
            equipment.setEquiID(request.getParameter("equiID"));
            equipment.setEquiname(request.getParameter("equiname"));
            equipment.setEquitype(request.getParameter("equitype"));
            equipment.setManager(request.getParameter("manager"));
            equipment.setMaindate(java.sql.Date.valueOf(request.getParameter("maindate")));
            equipment.setMaincontent(request.getParameter("maincontent"));

            equipmentService.addEquipment(equipment);
        }

        response.sendRedirect("Equip");
    }
}
