package kr.or.gaw.controller;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.service.BoardService;

@Controller
public class GeunBoardController {
	
	@Autowired
	BoardService boardservice;
	
	@RequestMapping("/board")
	public String board(Model model) {
		
		List list = new ArrayList();
		list = boardservice.listBoard();
		model.addAttribute("list", list);
		return "bulletin/board";
	}
	
	@RequestMapping("/board.do")
	public String boardCRU(BoardDTO dto, Model model) {
		
		int result = boardservice.boardDuplicate(dto.getBoard_id());
		int update = -1;
		int insert = -1;
		
		if (result >= 1) {
			dto.setCreated_by("geun"); // 나중에 세션으로 값을 받아와서 작성자를 바꿀 필요 있음
			update = boardservice.updateBoard(dto);
			
		} else {
			int maxnum = boardservice.maxBoardID();
			System.out.println("maxnum : " + maxnum);
			if(maxnum < 10) {
				dto.setBoard_id("B" + "00" + (maxnum+1));
			} else if (maxnum >= 10 && maxnum < 100) {
				dto.setBoard_id("B" + "0" + (maxnum+1));
			} else if (maxnum >= 100) {
				dto.setBoard_id("B" + (maxnum+1));
			}
			// 현재 시간을 java.sql.Date로 설정
		    LocalDateTime now = LocalDateTime.now(); // 현재 시간
		    Date hireDate = Date.valueOf(now.toLocalDate()); // LocalDateTime에서 LocalDate로 변환 후 java.sql.Date로 변환
		    dto.setCreated_at(hireDate);
		    dto.setCreated_by("geun"); // 나중에 세션으로 값을 받아와서 작성자를 바꿀 필요 있음
			insert = boardservice.insertBoard(dto);
		}
		return "redirect:board";
	}
	
	@RequestMapping("/board.delete")
	public String boardDelete(String board_id) {
		int result = -1;
		result = boardservice.deleteBoard(board_id);
		return "redirect:board";
	}
	
}
