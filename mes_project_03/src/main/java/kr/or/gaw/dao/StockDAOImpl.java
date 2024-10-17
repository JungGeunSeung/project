package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.StockMoveDTO;

@Repository
public class StockDAOImpl implements StockDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<StockMoveDTO> selectStock(){
		List<StockMoveDTO> list = sqlSession.selectList("kr.or.gaw.dao.StockDAO.selectStock");
		System.out.println("DAO 들어옴 오라클 연결 : "+list);
		return list;
		
	}
}
