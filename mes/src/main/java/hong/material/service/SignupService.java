package hong.material.service;

import hong.material.dao.SignupDAO;
import hong.material.dto.SignupDTO;

public class SignupService {

	public void signup(SignupDTO dto) {
		System.out.println("service signup 실행");
		SignupDAO dao = new SignupDAO();
		dao.signup(dto);
	}
}
