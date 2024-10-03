package geun.BOM.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import geun.BOM.dao.Doc_DAO;
import geun.BOM.dto.DocumentDTO;


public class Doc_Service {
	
	public List<DocumentDTO> getList() {
		System.out.println("Doc_Service의 getList 실행");
		Doc_DAO dao = new Doc_DAO();
		
		List<DocumentDTO> list = dao.selectAll();
	
		return list;
	}
	
	public DocumentDTO get(String docid) {
		System.out.println("Doc_Service의 get 실행");
		DocumentDTO dto = new DocumentDTO();
		
		Doc_DAO dao = new Doc_DAO();
		
		dto = dao.selectOne(docid);
		
		return dto;
	}
	
	public int register(DocumentDTO dto) {
		System.out.println("Doc_Service의 register 실행");
		// 원래는 DB에 insert 하는게 있어야 한다.
		System.out.println("등록중... " + dto.toString());
		
		Doc_DAO dao = new Doc_DAO();
		return dao.insert(dto);
		
	}
	
	public int update(DocumentDTO dto) {
		System.out.println("Doc_Service의 update 실행");
		Doc_DAO dao = new Doc_DAO();
		return dao.update(dto);
	}
	
	public int delete(int id) {
		System.out.println("Doc_Service의 delete 실행");
		Doc_DAO dao = new Doc_DAO();
		return dao.delete(id);
	}
	
	public int deleteSelect(List ids) {
		System.out.println("Doc_Service의 deleteSelect 실행");
		Doc_DAO dao = new Doc_DAO();
		return dao.deleteSelect(ids);
	}
	
	public Map getDocPage(String countPerPage, String page) {
		System.out.println("Doc_Service의 getDocPage 실행");
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
		System.out.println("Doc_Service의 getDoc 실행");
		Doc_DAO dao = new Doc_DAO();
		List result = dao.selectDoc(a);
		
		return result;
	}
	
	public List selectProduct(String document_id) {
		System.out.println("Doc_Service의 selectProduct 실행");
		List list = new ArrayList();
		
		Doc_DAO dao = new Doc_DAO();
		list = dao.selectPro(document_id);
		
		return list;
	}
}
