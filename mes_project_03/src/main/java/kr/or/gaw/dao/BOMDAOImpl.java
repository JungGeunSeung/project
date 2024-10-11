package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.BomDTO;

@Repository
public class BOMDAOImpl implements BOMDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<BomDTO> selectBomList(BomDTO dto) {
		List list = null;
		
		list = sqlSession.selectList("kr.or.gaw.dao.BOMDAO.selectBomByPage", dto);
		return list;
	}
	@Override
	public int getTotalDataCount(BomDTO dto) {
		return sqlSession.selectOne("kr.or.gaw.dao.BOMDAO.getTotalDataCount", dto);
	}
}
