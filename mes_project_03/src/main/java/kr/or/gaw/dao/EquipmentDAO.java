package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.EquipmentDTO;

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

}
