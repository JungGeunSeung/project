package kr.or.gaw.controller;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.dto.PostsDTO;
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
	
	@RequestMapping("/allposts")
	public String allposts(Model model, PostsDTO dto) {
		
		// 방어 코딩: page와 countPerPage가 null인 경우 기본값 설정
	    if (dto.getPage() == null) {
	        dto.setPage(1); // 기본 페이지 값
	    }
	    if (dto.getCountPerPage() == null) {
	        dto.setCountPerPage(10); // 기본 페이지 당 글 수 설정
	    }
		
		List list = new ArrayList();
		List list2 = new ArrayList();
		list = boardservice.listPosts(dto);
		list2 = boardservice.listBoard();
		model.addAttribute("post", list);
		model.addAttribute("board", list2);
		return "bulletin/allposts";
	}
	
	@PostMapping("/post.ajax")
    @ResponseBody
    public Map<String, Object> getBoardData(@RequestBody Map<String, String> requestData) {
        String boardName = requestData.get("board_name");

        // 여기서 boardName을 활용하여 비즈니스 로직 처리
        System.out.println("받은 보드 이름: " + boardName);

        // 응답 데이터 생성
        Map<String, Object> response = new HashMap();
        response.put("status", "success");
        response.put("message", "Board name received: " + boardName);

        return response; // JSON 형식으로 응답
    }
	
	// 게시글 읽는 페이지
	 @GetMapping("/post/read")
	    public String readPost(@RequestParam("post_id") String postId, Model model) {
	        PostsDTO post = boardservice.selectPostById(postId);
	        model.addAttribute("post", post);
	        return "bulletin/postOne";
	    }
	 
	 // 게시글 수정 페이지
	 @RequestMapping("/post/modify")
	 public String modifypost() {
		 return "bulletin/postModify";
	 }
}
