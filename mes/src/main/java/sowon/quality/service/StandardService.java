package sowon.quality.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sowon.quality.dao.StandardDAO;
import sowon.quality.dto.StandardDTO;

public class StandardService {

	public List<StandardDTO> getList() {
		StandardDAO dao = new StandardDAO();
		
		List<StandardDTO> list = dao.selectAll();
		
		return list;
	}
	
	public StandardDTO get(String tno1) {
		StandardDTO dto1 = new StandardDTO();
		System.out.println("service의 get 메소드 실행" + tno1);
		StandardDAO dao = new StandardDAO();
		dto1 = dao.selectOne(tno1);
	
		return dto1;
	}
	    
	public int register(StandardDTO dto) {
        
        int result = 0; // 기본값 설정
        try {
            result = 1; // 이 부분은 실제 DB 삽입 결과에 따라 달라질 수 있음
        } catch (Exception e) {
            e.printStackTrace();
            result = 0; // 실패 시 0 설정 또는 예외 처리
        }
        return result;
    }
   
	public int update(StandardDTO dto) {// 수정
		StandardDAO dao= new StandardDAO();
		return dao.update(dto);
	}
	
	public void create(StandardDTO dto) { // 추가
		StandardDAO standardDAO = new StandardDAO();
	}

	public int delete(String dto) { // 삭제
		StandardDAO dao = new StandardDAO();
		return dao.delete(dto);
	}
	public Map getStandardPage(String countPerPage, String page) {
        System.out.println("StandardService의 getStandardPage 메소드 실행");
		
		int count = Integer.parseInt(countPerPage);
        int pageNo = Integer.parseInt(page);

        int start = ((pageNo -1)* count) +1;
        int end = pageNo * count;

        StandardDAO dao = new StandardDAO();
        int totalCount = dao.totalsstandardPage();
        List list = dao.selectStandardPage(start, end);

        Map map = new HashMap();
        map.put("list", list);
        map.put("totalCount", totalCount);
        return map;
    }
	public List getStandard(String a) {

		StandardDAO dao = new StandardDAO();
        List result = dao.selectStandard(a);

        return result;
    }

    public List selectTit(String title) {
        List list = new ArrayList();

        StandardDAO dao = new StandardDAO();
        list = dao.selectTit(title);

        return list;
    }
  
    
    
}

	

