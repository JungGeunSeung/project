package daol.equipment.service;

import daol.equipment.dao.EquipmentDAO;
import daol.equipment.dto.EquipmentDTO;

import java.util.List;

public class EquipmentService {
    private EquipmentDAO equipmentDAO;

    public EquipmentService() {
        this.equipmentDAO = new EquipmentDAO();
    }

    public List<EquipmentDTO> getEquipmentByPage(int pageSize, int pageNumber) {
        return equipmentDAO.getEquipmentByPage(pageSize, pageNumber);
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

	public EquipmentDTO getEquipmentById(int equiID) {
		// TODO Auto-generated method stub
		return null;
	}
}
