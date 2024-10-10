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

	@Override
	public BoardDTO boardOne(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}


}
