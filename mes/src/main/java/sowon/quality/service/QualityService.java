package sowon.quality.service;

import java.util.List;



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
}
	

