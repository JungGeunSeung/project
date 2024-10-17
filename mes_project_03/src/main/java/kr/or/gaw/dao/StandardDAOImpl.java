package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.StandardDTO;

@Repository
public class StandardDAOImpl implements StandardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<StandardDTO> selectStandard(){
		List<StandardDTO> list = sqlSession.selectList("kr.or.gaw.dao.StandardDAO.selectStandard");
		return list;
	}
}
