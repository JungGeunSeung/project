package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.EmpDTO;
@Repository
public class EmpDAOImpl implements EmpDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	EmpDTO empDTO;
	
	
	@Override
	public List<EmpDTO> listEmp() {
		List<EmpDTO> result = sqlSession.selectList("kr.or.gaw.dao.EmpDAO.listEmp");
		return result;
	}

	@Override
	public int isUserIdDuplicate(String user_id) {
		int result = sqlSession.selectOne("kr.or.gaw.dao.EmpDAO.isUserIdDuplicate", user_id);
		return result;
	}
	
	@Override
	public EmpDTO listEmpOne(String user_id) {
		EmpDTO result = null;
		result = sqlSession.selectOne("kr.or.gaw.dao.EmpDAO.listEmpOne", user_id);
		
		return result;
	}
	
	@Override
	public int insertEmp(EmpDTO dto) {
		
		int result = -1;
		result = sqlSession.insert("kr.or.gaw.dao.EmpDAO.listEmpOne", dto);
		
		return result;
	}
	
	@Override
	public int updateEmpPassword(EmpDTO dto) {
		
		int result = -1;
		result = sqlSession.update("kr.or.gaw.dao.EmpDAO.updateEmpPassword", dto);
		
		return result;
	}

	@Override
	public List filterListEmp() {
		return sqlSession.selectList("kr.or.gaw.dao.EmpDAO.filterListEmp");
	}

	@Override
	public List deptList() {
		return sqlSession.selectList("kr.or.gaw.dao.EmpDAO.deptList");
	}

	@Override
	public int empUpdateToAdmin(EmpDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EmpDAO.empUpdateToAdmin",dto);
	}
	
	@Override
	public int emailUpdate(EmpDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EmpDAO.emailUpdate",dto);
	}

	@Override
	public int nameUpdate(EmpDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EmpDAO.nameUpdate",dto);
	}

	@Override
	public int phoneUpdate(EmpDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.EmpDAO.phoneUpdate",dto);
	}
	

}
