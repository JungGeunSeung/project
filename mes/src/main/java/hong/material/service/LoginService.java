package hong.material.service;

import hong.material.dao.UserDAO;
import hong.material.dto.UserDTO;

public class LoginService {

	public UserDTO login(String id,String pw) {
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.findUserById(id);
		System.out.println(dto);
		if(dto != null && dto.getPw().equals(pw)) {
			return dto;
		}
		else {
			return null;
		}
	}
}
