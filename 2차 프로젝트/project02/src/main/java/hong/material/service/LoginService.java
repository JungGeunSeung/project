package hong.material.service;

import java.util.List;

import hong.material.dao.MaterialStatusDAO;
import hong.material.dao.UserDAO;
import hong.material.dto.MaterialStatusDTO;
import hong.material.dto.UserDTO;

public class LoginService {

	public UserDTO login(String id,String pw) {
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.findUserById(id);
		
		if(dto != null && dto.getPw().equals(pw)) {
			return dto;
		}
		else {
			return null;
		}
	}
	
	public List<UserDTO> allList(){
		UserDAO dao = new UserDAO();
		List<UserDTO> list = dao.AllList();
		return list;
	}
	
	public UserDTO print(String str) {//번호에 해당 되는 dto만 가져오기
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.getDTO(str);
		return dto;
	}
	
	public void update(UserDTO dto) {//수정
		UserDAO dao = new UserDAO();
		dao.updateDTO(dto);
	}
}
