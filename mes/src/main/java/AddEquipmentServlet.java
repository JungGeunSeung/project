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
        request.getRequestDispatcher("/WEB-INF/equip/addEquipment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String equiID = request.getParameter("equiID");
        String equiname = request.getParameter("equiname");
        String equitype = request.getParameter("equitype");
        String equiloc = request.getParameter("equiloc");
        String status = request.getParameter("status");
        String maincontent = request.getParameter("maincontent");
        String manager = request.getParameter("manager");
        Date maindate = Date.valueOf(request.getParameter("maindate"));

        EquipmentDTO equipment = new EquipmentDTO();
        equipment.setEquiID(equiID);
        equipment.setEquiname(equiname);
        equipment.setEquitype(equitype);
        equipment.setEquiloc(equiloc);
        equipment.setStatus(status);
        equipment.setMaincontent(maincontent);
        equipment.setManager(manager);
        equipment.setMaindate(maindate);

        EquipmentService equipmentService = new EquipmentService();
        equipmentService.addEquipment(equipment);

        response.sendRedirect("Equip");
    }
}
