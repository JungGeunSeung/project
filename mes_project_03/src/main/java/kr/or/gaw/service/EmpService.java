package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.EmpDTO;

public interface EmpService {

	List<EmpDTO> listEmp();
	EmpDTO listEmpOne(String user_id);
	int insertEmp(EmpDTO dto);
	boolean isUserIdDuplicate(String user_id);
	int updateEmpPassword(EmpDTO dto);
	List filterListEmp();
	List deptList();
	int empUpdateToAdmin(EmpDTO dto);
	int emailUpdate(EmpDTO dto);
	int nameUpdate(EmpDTO dto);
	int phoneUpdate(EmpDTO dto);
	
}
