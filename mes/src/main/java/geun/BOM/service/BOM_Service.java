package geun.BOM.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import geun.BOM.dao.BOM_DAO;
import geun.BOM.dto.BOM_DTO;

public class BOM_Service {
	
	public List<BOM_DTO> getList() {
		
		BOM_DAO dao = new BOM_DAO();
		
		List<BOM_DTO> list = dao.selectAll();
	
		return list;
	}
	
	public BOM_DTO get(String bomid) {
		BOM_DTO dto1 = new BOM_DTO();
		
		BOM_DAO dao = new BOM_DAO();
		
		dto1 = dao.selectOne(bomid);
		
		return dto1;
	}
	
	public int register(BOM_DTO dto) {
		// 원래는 DB에 insert 하는게 있어야 한다.
		System.out.println("등록중... " + dto.toString());
		
		BOM_DAO dao = new BOM_DAO();
		return dao.insert(dto);
		
	}
	
	public int update(BOM_DTO dto) {
		BOM_DAO dao = new BOM_DAO();
		return dao.update(dto);
	}
	
	public int delete(String id) {
		BOM_DAO dao = new BOM_DAO();
		return dao.delete(id);
	}
	
	public Map getBOMPage(String countPerPage, String page) {
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		int start = ((pageNo -1)* count) +1;
		int end = pageNo * count;
		
		BOM_DAO dao = new BOM_DAO();
		int totalCount = dao.totalBOMPage();
		List list = dao.selectBOMPage(start, end);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public List getBOM(String a) {
			
		BOM_DAO dao = new BOM_DAO();
		List result = dao.selectBOM(a);
		
		return result;
	}
	
	public List selectProduct(String production_id) {
		List list = new ArrayList();
		
		BOM_DAO dao = new BOM_DAO();
		list = dao.selectPro(production_id);
		
		return list;
	}
}
