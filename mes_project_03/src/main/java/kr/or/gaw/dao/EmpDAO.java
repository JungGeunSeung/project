package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.EmpDTO;

@Mapper
public interface EmpDAO {
	
	List listEmp();
	EmpDTO listEmpOne(String user_id);
	int insertEmp(EmpDTO dto);
}
