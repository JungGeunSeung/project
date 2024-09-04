package daol.equipment.service;

import java.sql.Date;
import java.util.List;

import daol.equipment.dao.EquipmentDAO;
import daol.equipment.dto.EquipmentDTO;

public class EquipmentService {
    private EquipmentDAO equipmentDAO;

    public EquipmentService() {
        this.equipmentDAO = new EquipmentDAO();
    }

    public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
        return equipmentDAO.getEquipmentByPage(pageSize, pageNumber, sortField, sortOrder);
    }

    public int getTotalEquipmentCount() {
        return equipmentDAO.getTotalEquipmentCount();
    }

    public void addEquipment(EquipmentDTO equipment) {
        equipmentDAO.addEquipment(equipment);
    }

    public void updateEquipment(EquipmentDTO equipment) {
        equipmentDAO.updateEquipment(equipment);
    }

    public void deleteEquipment(String equiID) {
        equipmentDAO.deleteEquipment(equiID);
    }

    public EquipmentDTO getEquipmentById(String equiID) {
        return equipmentDAO.getEquipmentById(equiID);
    }

    public List<EquipmentDTO> getEquipmentByDateRange(Date startDate, Date endDate) {
        return equipmentDAO.getEquipmentByDateRange(startDate, endDate);
    }
}
