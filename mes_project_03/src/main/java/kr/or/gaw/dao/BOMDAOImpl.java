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

		list = sqlSession.selectList("kr.or.gaw.dao.BOMDAO.selectProduct", dto);
		return list;
	}

	@Override
	public int getTotalDataCount(BomDTO dto) {
		return sqlSession.selectOne("kr.or.gaw.dao.BOMDAO.getTotalDataCount", dto);
	}

	@Override
	public BomDTO selectOne(String bom_id) {
		BomDTO bomDTO = sqlSession.selectOne("kr.or.gaw.dao.BOMDAO.selecBomtOne", bom_id);
		return bomDTO;
	}

	@Override
	public int updateBom(BomDTO bomDTO) {
		int result = sqlSession.update("kr.or.gaw.dao.BOMDAO.updateBom", bomDTO);
		return result;
	}

	@Override
	public int insertBom(BomDTO bomDTO) {
		System.out.println("DAO 실행");
		int result = sqlSession.insert("kr.or.gaw.dao.BOMDAO.insertBom", bomDTO);
		return result;
	}

	@Override
	public int deleteBom(String bom_id) {
		int result = sqlSession.delete("kr.or.gaw.dao.BOMDAO.deleteBom", bom_id);
		return result;
	}

	@Override
	public List<BomDTO> selectBompList(String product_id) {
		return sqlSession.selectList("kr.or.gaw.dao.BOMDAO.selectProductByBom", product_id);
	}

	@Override
	public BomDTO getBomp(BomDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}