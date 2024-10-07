package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.EmpDTO;

public interface EmpService {

	List<EmpDTO> listEmp();
	EmpDTO listEmpOne(String user_id);
	int insertEmp(EmpDTO dto);
}
