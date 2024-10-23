package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.ClientDTO;
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
	
	@Override
	public List<ClientDTO> selectClient(){
		List<ClientDTO> list = sqlSession.selectList("kr.or.gaw.dto.StockDAO.selectClient");
		System.out.println("DAO 들어옴 오라클 연결 : "+list);
		return list;
	}
	
	@Override
    public int createClient(ClientDTO client) {
        return sqlSession.insert("kr.or.gaw.dao.StockDAO.createClient", client);
    }
	
	@Override
	public int updateClient(ClientDTO client) {
	    return sqlSession.update("kr.or.gaw.dao.StockDAO.updateClient", client); // 수정 쿼리 실행
	}
	
	@Override
	public int deleteClient(String clientId) {
	    System.out.println("dao롤러 삭제 "+clientId);

	    return sqlSession.delete("kr.or.gaw.dao.StockDAO.deleteClient", clientId);
	}

	
}
