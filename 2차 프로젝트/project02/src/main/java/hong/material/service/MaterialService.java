package hong.material.service;

import java.util.List;

import hong.material.dao.MaterialDAO;
import hong.material.dto.MaterialDTO;



public class MaterialService {

	public List<MaterialDTO> getMaterialList() {//전체 리스트 뽑기
		MaterialDAO materialDAO = new MaterialDAO();
		
		List<MaterialDTO> result = materialDAO.AllList();
		return result;
	}
	
	public MaterialDTO print(int i) {//번호에 해당 되는 dto만 가져오기
		MaterialDAO materialDAO = new MaterialDAO();
		
		MaterialDTO dto = materialDAO.getDTO(i);
		return dto;
	}
	
	public void update(MaterialDTO dto) {//수정
		MaterialDAO materialDAO = new MaterialDAO();
		materialDAO.updateDTO(dto);
	}
	
	public void create(MaterialDTO dto) {//추가
		MaterialDAO materialDAO = new MaterialDAO();
		materialDAO.adddto(dto);
	}
	
	public void delete(List<MaterialDTO> dto) {//삭제
		MaterialDAO materialDAO = new MaterialDAO();
		materialDAO.deletedto(dto);
	}
}
