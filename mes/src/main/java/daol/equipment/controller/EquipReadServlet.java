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
public class EquipReadServlet extends HttpServlet {

	private EquipmentService equipmentService;

	@Override
	public void init() throws ServletException {
		this.equipmentService = new EquipmentService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String equiID = request.getParameter("equiID");
	        if (equiID == null || equiID.isEmpty()) {
	            throw new IllegalArgumentException("Invalid equipment ID");
	        }

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
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		EquipmentDTO equipment = new EquipmentDTO();
		equipment.setEquiID(request.getParameter("equiID"));
		equipment.setEquiname(request.getParameter("equiname"));
		equipment.setEquitype(request.getParameter("equitype"));
		equipment.setManager(request.getParameter("manager"));
		equipment.setMaindate(java.sql.Date.valueOf(request.getParameter("maindate")));
		equipment.setMaincontent(request.getParameter("maincontent"));

		if ("update".equals(action)) {
			equipmentService.updateEquipment(equipment);
		} else if ("add".equals(action)) {
			equipmentService.addEquipment(equipment);
		}

		response.sendRedirect("Equip");
	}
}
