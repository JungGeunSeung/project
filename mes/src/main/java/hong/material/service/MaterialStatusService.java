package hong.material.service;

import java.util.List;

import hong.material.dao.MaterialStatusDAO;
import hong.material.dto.MaterialStatusDTO;



public class MaterialStatusService {

	public List<MaterialStatusDTO> getMaterialStatusList() {//전체 리스트 뽑기
		MaterialStatusDAO materialstatusDAO = new MaterialStatusDAO();
		
		List<MaterialStatusDTO> result = materialstatusDAO.AllList();
		return result;
	}
	
	public MaterialStatusDTO print(String str) {//번호에 해당 되는 dto만 가져오기
		MaterialStatusDAO dao = new MaterialStatusDAO();
		
		MaterialStatusDTO dto = dao.getDTO(str);
		return dto;
	}
	
	public void update(MaterialStatusDTO dto) {//수정
		MaterialStatusDAO dao = new MaterialStatusDAO();
		dao.updateDTO(dto);
	}
	
	public void create(MaterialStatusDTO dto) {//추가
		MaterialStatusDAO dao = new MaterialStatusDAO();
		dao.adddto(dto);
	}
	
	public void delete(List<MaterialStatusDTO> dto) {//삭제
		MaterialStatusDAO dao = new MaterialStatusDAO();
		dao.deletedto(dto);
	}
}
