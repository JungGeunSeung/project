package daol.equipment.controller;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daol.equipment.dto.EquipmentDTO;
import daol.equipment.service.EquipmentService;

@WebServlet("/addEquipment")
public class AddEquipmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
        request.getRequestDispatcher("/WEB-INF/equip/addEquipment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
        String equiID = request.getParameter("equiID");
        String equiname = request.getParameter("equiname");
        String equitype = request.getParameter("equitype");
        String equiloc = request.getParameter("equiloc");
        Date selldate = Date.valueOf(request.getParameter("selldate"));
        String status = request.getParameter("status");
        String maincontent = request.getParameter("maincontent");
        String manager = request.getParameter("manager");
        Date maindate = Date.valueOf(request.getParameter("maindate"));
        
        //디버깅
        System.out.println("maindate: " + maindate);             
        EquipmentDTO equipment = new EquipmentDTO();
        
        equipment.setEquiID(equiID);
        equipment.setEquiname(equiname);
        equipment.setEquitype(equitype);
        equipment.setEquiloc(equiloc);
        equipment.setSelldate(selldate);
        equipment.setStatus(status);
        equipment.setMaincontent(maincontent);
        equipment.setManager(manager);
        equipment.setMaindate(maindate);

        EquipmentService equipmentService = new EquipmentService();
        equipmentService.addEquipment(equipment);

        response.sendRedirect("Equip");
    }
}
