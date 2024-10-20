package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.EquipmentDAO;
import kr.or.gaw.dto.EquipmentDTO;

@Service
public class EquipmentService {

	@Autowired
	EquipmentDAO equipmentDAO;
	
	public List listEquip(EquipmentDTO dto) {
		return equipmentDAO.listEquip(dto);
	}

	public int totalEquipmentWithSearch(EquipmentDTO dto) {
		return equipmentDAO.totalEquipmentWithSearch(dto);
	}
	
	public List searchTypeEquip() {
		return equipmentDAO.searchTypeEquip();
	}
	
	public List searchLocationEquip() {
		return equipmentDAO.searchLocationEquip();
	}
	
	public List searchStatusEquip() {
		return equipmentDAO.searchStatusEquip();
	}
	
	public int maxEquipID() {
		return equipmentDAO.maxEquipID();
	}
	
	public int insertEquip(EquipmentDTO dto) {
		return equipmentDAO.insertEquip(dto);
	}
	
	public int updateEquip(EquipmentDTO dto) {
		return equipmentDAO.updateEquip(dto);
	}
	
	public int deleteEquip(String euqip_id) {
		return equipmentDAO.deleteEquip(euqip_id);
	}
}
