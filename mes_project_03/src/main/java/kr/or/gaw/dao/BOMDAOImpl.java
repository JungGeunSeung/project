package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.dto.EmpDTO;
@Repository
public class BOMDAOImpl implements BOMDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<BomDTO> selectBom(){
		List<BomDTO> result = sqlSession.selectList("kr.or.gaw.dao.EmpDAO.selectBOM");
		return result;
		
	}
	@Override
	public List<BomDTO> selectBomByPage(int page, int pageSize) {
	    int offset = (page - 1) * pageSize; 
	    // map이나 dto에 넣어서 하나만 전달 할 수 있다
	    return sqlSession.selectList("kr.or.gaw.dao.BomDAO.selectBOMByPage");
	}
	@Override
	public int getBomCount() {
	    return sqlSession.selectOne("kr.or.gaw.dao.BomDAO.getBomCount");
	}

}
