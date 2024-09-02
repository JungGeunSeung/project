package geun.document.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import geun.document.dao.Doc_DAO;
import geun.document.dto.DocumentDTO;


public class Doc_Service {
	
	public List<DocumentDTO> getList() {
		
		Doc_DAO dao = new Doc_DAO();
		
		List<DocumentDTO> list = dao.selectAll();
	
		return list;
	}
	
	public DocumentDTO get(String bomid) {
		DocumentDTO dto1 = new DocumentDTO();
		
		Doc_DAO dao = new Doc_DAO();
		
		dto1 = dao.selectOne(bomid);
		
		return dto1;
	}
	
	public int register(DocumentDTO dto) {
		// 원래는 DB에 insert 하는게 있어야 한다.
		System.out.println("등록중... " + dto.toString());
		
		Doc_DAO dao = new Doc_DAO();
		return dao.insert(dto);
		
	}
	
	public int update(DocumentDTO dto) {
		Doc_DAO dao = new Doc_DAO();
		return dao.update(dto);
	}
	
	public int delete(int id) {
		Doc_DAO dao = new Doc_DAO();
		return dao.delete(id);
	}
	
	public Map getDocPage(String countPerPage, String page) {
		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);
		
		int start = ((pageNo -1)* count) +1;
		int end = pageNo * count;
		
		Doc_DAO dao = new Doc_DAO();
		int totalCount = dao.totalDocPage();
		List list = dao.selectDocPage(start, end);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public List getDoc(String a) {
			
		Doc_DAO dao = new Doc_DAO();
		List result = dao.selectDoc(a);
		
		return result;
	}
	
	public List selectProduct(String document_id) {
		List list = new ArrayList();
		
		Doc_DAO dao = new Doc_DAO();
		list = dao.selectPro(document_id);
		
		return list;
	}
}
