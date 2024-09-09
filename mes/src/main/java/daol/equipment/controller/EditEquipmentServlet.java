package daol.equipment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daol.equipment.dto.EquipmentDTO;
import daol.equipment.service.EquipmentService;

@WebServlet("/EditEquipmentServlet")
public class EditEquipmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EquipmentService equipmentService;

    public EditEquipmentServlet() {
        this.equipmentService = new EquipmentService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
    	String equiID = request.getParameter("equiID");
        EquipmentDTO equipment = equipmentService.getEquipmentById(equiID);
        request.setAttribute("equipment", equipment);
        
        request.getRequestDispatcher("/WEB-INF/equip/editEquipment.jsp").forward(request, response);
    }
}
