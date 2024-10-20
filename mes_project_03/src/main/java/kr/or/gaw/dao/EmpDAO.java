package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.EmpDTO;

@Mapper
public interface EmpDAO {
	
	List listEmp();
	EmpDTO listEmpOne(String user_id);
	int insertEmp(EmpDTO dto);
	int isUserIdDuplicate(String user_id);
	int updateEmpPassword(EmpDTO dto);
	List filterListEmp();
	List deptList();
	int empUpdateToAdmin(EmpDTO dto);
	int emailUpdate(EmpDTO dto);
	int nameUpdate(EmpDTO dto);
	int phoneUpdate(EmpDTO dto);
	int profileUpdate(EmpDTO dto);
	int profileDelete(EmpDTO dto);
	int deleteEmp(EmpDTO dto);
}
