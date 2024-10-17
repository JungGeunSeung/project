package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.EmpDAO;
import kr.or.gaw.dto.EmpDTO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	EmpDAO empDAO;
	
	@Override
	public List<EmpDTO> listEmp() {
		List<EmpDTO> list = empDAO.listEmp();
		return list;
	}

	@Override
	public boolean isUserIdDuplicate(String user_id) {
		
		boolean result = empDAO.isUserIdDuplicate(user_id) > 0;
		return result;
	}

	@Override
	public EmpDTO listEmpOne(String user_id) {
		EmpDTO result = null;
		result = empDAO.listEmpOne(user_id);
		return result;
	}

	@Override
	public int insertEmp(EmpDTO dto) {
		int result = -2;
		result = empDAO.insertEmp(dto);
		return 0;
	}

	@Override
	public int updateEmpPassword(EmpDTO dto) {
			int result = -1;
			result = empDAO.updateEmpPassword(dto);
		return result;
	}

	@Override
	public List filterListEmp() {
		return empDAO.filterListEmp();
	}

	@Override
	public List deptList() {
		return empDAO.deptList();
	}

	@Override
	public int empUpdateToAdmin(EmpDTO dto) {
		return empDAO.empUpdateToAdmin(dto);
	}
	
	
}
