package sowon.defect.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sowon.defect.dao.DefectDAO;
import sowon.defect.dto.DefectDTO;

public class DefectService {

	public List<DefectDTO> getList() {
		DefectDAO dao = new DefectDAO();
		
		List<DefectDTO> list = dao.selectAll();
		
		return list;
	}
	
	public DefectDTO get(String tno1) {
		DefectDTO dto1 = new DefectDTO();
		System.out.println("service의 get 메소드 실행" + tno1);
		DefectDAO dao = new DefectDAO();
		dto1 = dao.selectOne(tno1);
	
		return dto1;
	}
	    
	public int register(DefectDTO dto) {
        // DB 연결 및 insert 로직 처리
        // 예: INSERT INTO quality_table (columns...) VALUES (dto.get...);
        
        int result = 0; // 기본값 설정
        try {
            // 데이터베이스에 삽입 후 성공 시 result를 1로 설정
            result = 1; // 이 부분은 실제 DB 삽입 결과에 따라 달라질 수 있음
        } catch (Exception e) {
            e.printStackTrace();
            result = 0; // 실패 시 0 설정 또는 예외 처리
        }
        return result;
    }
   
	public int update(DefectDTO dto) {// 수정
		DefectDAO dao= new DefectDAO();
		return dao.update(dto);
	}
	
	public void create(DefectDTO dto) { // 추가
		DefectDAO deffectDAO = new DefectDAO();
	}

	public int delete(String dto) { // 삭제
		DefectDAO dao = new DefectDAO();
		return dao.delete(dto);
	}
	public Map getDefectPage(String countPerPage, String page) {
        System.out.println("DefectService의 getDefectPage 메소드 실행");
		
		int count = Integer.parseInt(countPerPage);
        int pageNo = Integer.parseInt(page);

        int start = ((pageNo -1)* count) +1;
        int end = pageNo * count;

        DefectDAO dao = new DefectDAO();
        int totalCount = dao.totalDefectPage();
        List list = dao.selectDefectPage(start, end);

        Map map = new HashMap();
        map.put("list", list);
        map.put("totalCount", totalCount);
        return map;
    }
	public List getDefect(String a) {

		DefectDAO dao = new DefectDAO();
        List result = dao.selectDefect(a);

        return result;
    }

    public List selectProduct(String production_id) {
        List list = new ArrayList();

        DefectDAO dao = new DefectDAO();
        list = dao.selectPro(production_id);

        return list;
    }
  
    
    
}

	

