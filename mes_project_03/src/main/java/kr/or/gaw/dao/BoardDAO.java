package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.BoardDTO;

@Mapper
public interface BoardDAO {
	
	List listBoard();
	BoardDTO boardOne(String user_id);
	int insertBoard(BoardDTO dto);
	int updateBoard(BoardDTO dto);
	int deleteBoard(String board_id);
	int boardDuplicate(String board_id);
}
