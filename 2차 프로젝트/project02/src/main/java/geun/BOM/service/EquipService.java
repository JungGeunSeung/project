package geun.BOM.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import geun.BOM.dao.EquipmentDAO;
import geun.BOM.dto.EquipmentDTO;


public class EquipService {
	
	public List<EquipmentDTO> getList() {
		System.out.println("EquipService의 getList 실행");
		EquipmentDAO dao = new EquipmentDAO();
		
		List<EquipmentDTO> list = dao.selectAll();
	
		return list;
	}
	
	public EquipmentDTO get(String docid) {
		System.out.println("EquipService의 get 실행");
		EquipmentDTO dto = new EquipmentDTO();
		
		EquipmentDAO dao = new EquipmentDAO();
		
		dto = dao.selectOne(docid);
		
		return dto;
	}
	
	public int register(EquipmentDTO dto) {
		System.out.println("EquipService의 register 실행");
		// 원래는 DB에 insert 하는게 있어야 한다.
		System.out.println("등록중... " + dto.toString());
		
		EquipmentDAO dao = new EquipmentDAO();
		return dao.insert(dto);
		
	}
	
	public int update(EquipmentDTO dto) {
		System.out.println("EquipService의 update 실행");
		EquipmentDAO dao = new EquipmentDAO();
		return dao.update(dto);
	}
	
	public int delete(String id) {
		System.out.println("EquipService의 delete 실행");
		EquipmentDAO dao = new EquipmentDAO();
		return dao.delete(id);
	}
	
	public int deleteSelect(List ids) {
		System.out.println("EquipService의 deleteSelect 실행");
		EquipmentDAO dao = new EquipmentDAO();
		return dao.deleteSelect(ids);
	}
	
	public Map getEquipPage(String countPerPage, String page) {
		System.out.println("EquipService의 getEquipPage 실행");
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		int start = ((pageNo -1)* count) +1;
		int end = pageNo * count;
		
		EquipmentDAO dao = new EquipmentDAO();
		int totalCount = dao.totalEquipPage();
		List list = dao.selectEquipPage(start, end);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public List getEquip(String a) {
		System.out.println("EquipService의 getEquip 실행");
		EquipmentDAO dao = new EquipmentDAO();
		List result = dao.selectEquip(a);
		
		return result;
	}
	
	public List selectProduct(String document_id) {
		System.out.println("EquipService의 selectProduct 실행");
		List list = new ArrayList();
		
		EquipmentDAO dao = new EquipmentDAO();
		list = dao.selectPro(document_id);
		
		return list;
	}
}
