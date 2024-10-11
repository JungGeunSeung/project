package kr.or.gaw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BoardDAO;
import kr.or.gaw.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDTO boardDTO;
	
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List listBoard() {
		List list = new ArrayList();
		list = boardDAO.listBoard();
		
		return list;
	}
	
	public int boardDuplicate(String board_id) {
		int result = -1;
		result = boardDAO.boardDuplicate(board_id);
		return result;
	}
	
	public int maxBoardID() {
		int result = -1;
		result = boardDAO.maxBoardID();
		return result;
	}
	
	@Override
	public BoardDTO boardOne(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		int result = -1;
		result = boardDAO.insertBoard(dto);
		return result;
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		int result = -1;
		result = boardDAO.updateBoard(dto);
		return result;
	}

	@Override
	public int deleteBoard(String board_id) {
		int result = -1;
		result = boardDAO.deleteBoard(board_id);
		return result;
	}


}
