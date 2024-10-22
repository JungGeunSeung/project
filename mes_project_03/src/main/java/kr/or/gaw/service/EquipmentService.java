package kr.or.gaw.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.EquipmentDAO;
import kr.or.gaw.dto.DowntimeDTO;
import kr.or.gaw.dto.EquipmentDTO;
import kr.or.gaw.dto.MaintenanceDTO;

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
	
	//////////////////// 유지보수 ///////////////////////////
	
	// 유지보수 리스트 뽑기
	public List listMaintenance(MaintenanceDTO dto) {
		return equipmentDAO.listMaintenance(dto);
	}
	
	// 검색조건의 따른 유지보수 리스트 뽑기
	public int totalMaintenanceWithSearch(MaintenanceDTO dto) {
		return equipmentDAO.totalMaintenanceWithSearch(dto);
	}
	
	// 설비 아이디랑 설비 이름만 뽑기
	public List listEquipIDandName() {
		return equipmentDAO.listEquipIDandName();
	}
	
	// 유지보수 아이디 최대값 구하기
	public int maxMaintenanceID() {
		return equipmentDAO.maxMaintenanceID();
	}
	
	// 유지보수 추가하기
	public int insertMaintenance(MaintenanceDTO dto) {
		int result = equipmentDAO.insertMaintenance(dto);
		
		// 최신 유지보수 날짜 가져오기
        Date latestDate = equipmentDAO.getLatestMaintenanceDate(dto.getEquip_id());

        // 설비 테이블의 last 컬럼 업데이트
        equipmentDAO.updateLastMaintenanceDate(dto.getEquip_id(), latestDate);
		return result;
	}
	
	// 유지보수 수정하기
	public int updateMaintenance(MaintenanceDTO dto) {
		// 최신 유지보수 날짜 가져오기
        Date latestDate = equipmentDAO.getLatestMaintenanceDate(dto.getEquip_id());

        // 설비 테이블의 last 컬럼 업데이트
        equipmentDAO.updateLastMaintenanceDate(dto.getEquip_id(), latestDate);
		return equipmentDAO.updateMaintenance(dto);
	}
	
	// 유지보수 삭제하기
	public int deleteMaintenance(String main_id) {
		return equipmentDAO.deleteMaintenance(main_id);
	}
	
	//////////////////// 비가동 ///////////////////////////
	
	// 비가동 리스트 뽑기
	public List listDowntime(DowntimeDTO dto) {
		return equipmentDAO.listDowntime(dto);
	}
	
	// 검색조건의 따른 비가동 리스트 뽑기
	public int totalDowntimeWithSearch(DowntimeDTO dto) {
		return equipmentDAO.totalDowntimeWithSearch(dto);
	}
	
	// 비가동 아이디 최대값 구하기
	public int maxDowntimeID() {
		return equipmentDAO.maxDowntimeID();
	}
	
	// 비가동 추가하기
	public int insertDowntime(DowntimeDTO dto) {
		int result = equipmentDAO.insertDowntime(dto);
		return result;
	}
	
	// 비가동 수정하기
	public int updateDowntime(DowntimeDTO dto) {
		return equipmentDAO.updateDowntime(dto);
	}
	
	// 비가동 삭제하기
	public int deleteDowntime(String downtime_id) {
		return equipmentDAO.deleteDowntime(downtime_id);
	}
}
