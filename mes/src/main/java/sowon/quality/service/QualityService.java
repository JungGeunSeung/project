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
	
}
