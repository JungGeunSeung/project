package kr.or.gaw.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.service.BoardService;

@Controller
public class GeunBoardController {
	
	@Autowired
	BoardService postservice;
	
	@RequestMapping("/board")
	public String posts(Model model) {
		
		List list = new ArrayList();
		list = postservice.listBoard();
		model.addAttribute("dto", list);
		return "bulletin/board";
	}
	
}
