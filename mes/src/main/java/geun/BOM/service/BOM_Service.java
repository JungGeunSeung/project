package geun.BOM.service;

import java.util.List;

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
}
