package sowon.quality.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sowon.quality.dao.QualityDAO;
import sowon.quality.dto.QualityDTO;

public class QualityService {

	public List<QualityDTO> getList() {
		QualityDAO dao = new QualityDAO();
		
		List<QualityDTO> list = dao.selectAll();
		
		return list;
	}
	
	public QualityDTO get(String tno1) {
		QualityDTO dto1 = new QualityDTO();
		System.out.println("service의 get 메소드 실행" + tno1);
		QualityDAO dao = new QualityDAO();
		dto1 = dao.selectOne(tno1);
	
		return dto1;
	}
	    
	public int register(QualityDTO dto) {
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
   
	public int update(QualityDTO dto) {// 수정
		QualityDAO dao= new QualityDAO();
		return dao.update(dto);
	}
	
	public void create(QualityDTO dto) { // 추가
	    QualityDAO qualityDAO = new QualityDAO();
	    qualityDAO.addDto(dto); // QualityDAO 객체의 addDto 메서드 호출
	}

	public int delete(String dto) { // 삭제
		QualityDAO dao = new QualityDAO();
		return dao.delete(dto);
	}
	public Map getQualityPage(String countPerPage, String page) {
        System.out.println("QualityService의 getQualityPage 메소드 실행");
		
		int count = Integer.parseInt(countPerPage);
        int pageNo = Integer.parseInt(page);

        int start = ((pageNo -1)* count) +1;
        int end = pageNo * count;

        QualityDAO dao = new QualityDAO();
        int totalCount = dao.totalQualityPage();
        List list = dao.selectQualityPage(start, end);

        Map map = new HashMap();
        map.put("list", list);
        map.put("totalCount", totalCount);
        return map;
    }
	public List getQuality(String a) {

		QualityDAO dao = new QualityDAO();
        List result = dao.selectQuality(a);

        return result;
    }

    public List selectProduct(String production_id) {
        List list = new ArrayList();

        QualityDAO dao = new QualityDAO();
        list = dao.selectPro(production_id);

        return list;
    }
  
    
    
}

	

