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
}
