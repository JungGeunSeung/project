package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.BoardDTO;


public interface BoardService {
	List listBoard();
	BoardDTO boardOne(String user_id);
	int insertBoard(BoardDTO dto);
	int updateBoard(BoardDTO dto);
	int deleteBoard(String board_id);
	int boardDuplicate(String board_id);
}
