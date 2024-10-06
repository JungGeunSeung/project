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
		System.out.println("EmpDAOImpl 실행 listEmp()");
		List<EmpDTO> result = sqlSession.selectList("geun.EmpDAO.listEmp");
		return result;
	}

}
