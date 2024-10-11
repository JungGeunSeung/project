package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	BoardDTO boardDTO;
	
	
	// 전체 리스트 뽑기
	@Override
	public List listBoard() {
		
		List<BoardDTO> result = sqlSession.selectList("kr.or.gaw.dao.EmpDAO.listBoard");
		return result;
	}
	// 중복 검사
	@Override
	public int boardDuplicate(String board_id) {
		int result = -1;
		result = sqlSession.selectOne("kr.or.gaw.dao.EmpDAO.boardDuplicate", board_id);
		return result;
	}

	// 하나만 고르기
	@Override
	public BoardDTO boardOne(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 추가하기
	@Override
	public int insertBoard(BoardDTO dto) {
		int result = -1;
		result = sqlSession.insert("kr.or.gaw.dao.EmpDAO.insertBoard", dto);
		return result;
	}

	// 수정하기
	@Override
	public int updateBoard(BoardDTO dto) {
		int result = -1;
		result = sqlSession.update("kr.or.gaw.dao.EmpDAO.updateBoard", dto);
		return result;
	}

	// 삭제하기
	@Override
	public int deleteBoard(String board_id) {
		int result = -1;
		result = sqlSession.delete("kr.or.gaw.dao.EmpDAO.deleteBoard", board_id);
		return result;
	}



}
