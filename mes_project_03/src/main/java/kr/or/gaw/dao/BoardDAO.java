package kr.or.gaw.dao;

import java.util.List;

import kr.or.gaw.dto.BoardDTO;


public interface BoardDAO {
	List listBoard();
	BoardDTO boardOne(String user_id);
	int insertBoard(BoardDTO dto);
	int updateBoard(BoardDTO dto);
	int deleteBoard(BoardDTO dto);
}
