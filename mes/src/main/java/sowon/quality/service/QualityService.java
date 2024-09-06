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
        
        int result = 0; 
        try {
           
            result = 1; 
        } catch (Exception e) {
            e.printStackTrace();
            result = 0; 
        }
        return result;
    }
   
	public int update(QualityDTO dto) {
		QualityDAO dao= new QualityDAO();
		return dao.update(dto);
	}
	
	public void create(QualityDTO dto) { 
	    QualityDAO qualityDAO = new QualityDAO();
//	    qualityDAO.addDto(dto);
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
  
    public int deleteSelect(List ids) {
		System.out.println("QualityService의 deleteSelect 실행");
		QualityDAO dao = new QualityDAO();
		return dao.deleteSelect(ids);
	}
    
}

	

