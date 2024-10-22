package kr.or.gaw.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.DowntimeDTO;
import kr.or.gaw.dto.EquipmentDTO;
import kr.or.gaw.dto.MaintenanceDTO;

@Repository
public class EquipmentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 설비 리스트 뽑기
	public List listEquip(EquipmentDTO dto) {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.listEquip", dto);
	}
	
	// 검색조건의 따른 리스트 뽑기
	public int totalEquipmentWithSearch(EquipmentDTO dto) {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.totalEquipmentWithSearch", dto);
	}
	
	// 설비 유형만 뽑기
	public List searchTypeEquip() {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.searchTypeEquip");
	}
	
	// 설비 위치만 뽑기
	public List searchLocationEquip() {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.searchLocationEquip");
	}
	
	// 설비 상태만 뽑기
	public List searchStatusEquip() {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.searchStatusEquip");
	}
	
	// 설비 아이디 최대값 구하기
	public int maxEquipID() {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.maxEquipID");
	}
	
	// 설비 추가하기
	public int insertEquip(EquipmentDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.EquipmentDAO.insertEquip", dto);
	}
	
	// 설비 수정하기
	public int updateEquip(EquipmentDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EquipmentDAO.updateEquip", dto);
	}
	
	// 설비 삭제하기
	public int deleteEquip(String euqip_id) {
		return sqlSession.delete("kr.or.gaw.dao.EquipmentDAO.deleteEquip", euqip_id);
	}
	
	
	//////////////////////////// 유지보수 ////////////////////////////////////
	
	
	// 유지보수 리스트 뽑기
	public List listMaintenance(MaintenanceDTO dto) {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.listMaintenance", dto);
	}
	
	// 검색조건의 따른 유지보수 리스트 뽑기
	public int totalMaintenanceWithSearch(MaintenanceDTO dto) {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.totalMaintenanceWithSearch", dto);
	}
	
	// 설비 아이디랑 설비 이름만 뽑기
	public List listEquipIDandName() {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.listEquipIDandName");
	}
	
	// 유지보수 아이디 최대값 구하기
	public int maxMaintenanceID() {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.maxMaintenanceID");
	}
	
	// 유지보수 추가하기
	public int insertMaintenance(MaintenanceDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.EquipmentDAO.insertMaintenance", dto);
	}
	
	// 유지보수 수정하기
	public int updateMaintenance(MaintenanceDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EquipmentDAO.updateMaintenance", dto);
	}
	
	// 유지보수 삭제하기
	public int deleteMaintenance(String main_id) {
		return sqlSession.delete("kr.or.gaw.dao.EquipmentDAO.deleteMaintenance", main_id);
	}

	public Date getLatestMaintenanceDate(String equip_id) {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.getLatestMaintenanceDate", equip_id);
	}

	public void updateLastMaintenanceDate(String equip_id, Date latestDate) {
		Map<String, Object> params = new HashMap();
	    params.put("equip_id", equip_id);
	    params.put("last", latestDate);
	    sqlSession.update("kr.or.gaw.dao.EquipmentDAO.updateLastMaintenanceDate", params);
	}

	public List listDowntime(DowntimeDTO dto) {
		return sqlSession.selectList("kr.or.gaw.dao.EquipmentDAO.listDowntime", dto);
	}
	
	public int totalDowntimeWithSearch(DowntimeDTO dto) {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.totalDowntimeWithSearch", dto);
	}
	
	public int maxDowntimeID() {
		return sqlSession.selectOne("kr.or.gaw.dao.EquipmentDAO.maxDowntimeID");
	}
	
	public int insertDowntime(DowntimeDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.EquipmentDAO.insertDowntime", dto);
	}
	
	public int updateDowntime(DowntimeDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.EquipmentDAO.updateDowntime", dto);
	}
	
	public int deleteDowntime(String downtime_id) {
		return sqlSession.delete("kr.or.gaw.dao.EquipmentDAO.deleteDowntime", downtime_id);
	}
	
}
