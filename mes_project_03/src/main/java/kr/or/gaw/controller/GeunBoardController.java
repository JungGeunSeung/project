package kr.or.gaw.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import kr.or.gaw.dto.CommentsDTO;
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
			Timestamp hireDate = Timestamp.valueOf(now); // LocalDateTime을 java.sql.Timestamp로 변환
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
	public String allposts(Model model,
	                       @RequestParam(value = "countPerPage", required = false) Integer countPerPage,
	                       @RequestParam(value = "page", required = false) Integer page,
	                       @RequestParam(value = "searchType", required = false) String searchType,
	                       @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {

	    // 기본값 설정
	    if (page == null) {
	        page = 1;
	    }
	    if (countPerPage == null) {
	        countPerPage = 10;
	    }

	    // 검색 조건이 없는 경우 기본값 설정
	    if (searchType == null) {
	        searchType = "all";
	    }
	    if (searchKeyword == null) {
	        searchKeyword = "";
	    }

	    // PostsDTO에 검색 관련 정보 추가
	    PostsDTO dto = new PostsDTO();
	    dto.setPage(page);
	    dto.setCountPerPage(countPerPage);
	    dto.setSearchType(searchType);
	    dto.setSearchKeyword(searchKeyword);
	    
	 // startRow와 endRow 계산
	    int startRow = (dto.getPage() - 1) * dto.getCountPerPage() + 1;
	    int endRow = dto.getPage() * dto.getCountPerPage();

	    
	    dto.setStartRow(startRow);
	    dto.setEndRow(endRow);
	    
	    // 게시물 목록 가져오기
	    List<PostsDTO> postList = boardservice.listPosts(dto);
	    List<BoardDTO> boardList = boardservice.listBoard();

	    int totalPosts = boardservice.totalPostsWithSearch(dto); // 검색 조건에 맞는 총 게시물 수
	    int totalPages = (int) Math.ceil((double) totalPosts / countPerPage);

	    // 페이지네이션 계산
	    int displayPageCount = 5;
	    int startPage = Math.max(1, page - displayPageCount / 2);
	    int endPage = Math.min(totalPages, startPage + displayPageCount - 1);

	    boolean hasPrev = startPage > 1;
	    boolean hasNext = endPage < totalPages;
	    int prevPage = page - 1;
	    int nextPage = page + 1;

	    // 페이지네이션 정보 추가
	    Map<String, Object> pagination = new HashMap();
	    pagination.put("currentPage", page);
	    pagination.put("totalPages", totalPages);
	    pagination.put("startPage", startPage);
	    pagination.put("endPage", endPage);
	    pagination.put("hasPrev", hasPrev);
	    pagination.put("hasNext", hasNext);
	    pagination.put("prevPage", prevPage);
	    pagination.put("nextPage", nextPage);
	    pagination.put("countPerPage", countPerPage);

	    // 모델에 추가
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("post", postList);
	    model.addAttribute("board", boardList);
	    model.addAttribute("searchType", searchType);   // 검색 필터를 유지
	    model.addAttribute("searchKeyword", searchKeyword);  // 검색어를 유지

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
	 @GetMapping("/post.read")
	    public String readPost(@RequestParam("post_id") String postId, Model model) {
	        PostsDTO post = boardservice.selectPostById(postId);
	        List comments = boardservice.listComments(postId);
	        model.addAttribute("post", post);
	        model.addAttribute("comments", comments);
	        return "bulletin/postOne";
	    }
	 
	 // 게시글 수정 페이지
	 @RequestMapping("/post.modify")
	 public String modifypost() {
		 return "bulletin/postModify";
	 }
	 
	 // 댓글 등록
	 @RequestMapping("/comment.insert")
	 public String commentInsert(CommentsDTO dto) {
		 
		 LocalDateTime now = LocalDateTime.now(); // 현재 시간
		 Timestamp hireDate = Timestamp.valueOf(now); // LocalDateTime을 java.sql.Timestamp로 변환
		 	dto.setCreated_at(hireDate);
		    dto.setEmployee_id("geun"); // 나중에 세션으로 값을 받아와서 작성자를 바꿀 필요 있음
		    
		    int maxnum = boardservice.maxCommentsId();
			System.out.println("maxnum : " + maxnum);
			if(maxnum < 10) {
				dto.setComment_id("C" + "00" + (maxnum+1));
			} else if (maxnum >= 10 && maxnum < 100) {
				dto.setComment_id("C" + "0" + (maxnum+1));
			} else if (maxnum >= 100) {
				dto.setComment_id("C" + (maxnum+1));
			}
		 int result = boardservice.insertComment(dto);
		 
		 return "redirect:post.read?post_id="+dto.getPost_id();
	 }
	 
	 // 댓글 수정
	 @PostMapping("/updateComment")
	 @ResponseBody
	 public Map<String, Object> updateComment(@RequestBody Map<String, String> requestData, CommentsDTO dto) {
	     
		 System.out.println(requestData.get("comment_id"));
	     String commentId = requestData.get("comment_id");
	     String content = requestData.get("content");
	     dto.setComment_id(commentId);
	     dto.setContent(content);
	     
	     LocalDateTime now = LocalDateTime.now(); 
	     Timestamp hireDate = Timestamp.valueOf(now);
	     dto.setCreated_at(hireDate);
	     
	     // 댓글 업데이트 로직
	     int result = boardservice.updateComment(dto);
	     
	     // 1 이상이면 true, 그렇지 않으면 false
	     boolean success = (result > 0);
	     
	     // 응답 데이터
	     Map<String, Object> response = new HashMap();
	     response.put("success", success);
	     
	     return response;  // 반드시 JSON 형식으로 반환
	 }

	 
	 // 댓글 삭제
	 @PostMapping("/deleteComment")
	 @ResponseBody
	 public Map<String, Object> deleteComment(@RequestBody Map<String, String> requestData) {
	     String commentId = requestData.get("comment_id");

	     // 댓글 삭제 로직 (DB에서 삭제)
	     int result = boardservice.deleteComment(commentId);  // 삭제된 행의 개수를 반환

	     // 응답 데이터 생성
	     Map<String, Object> response = new HashMap();
	     response.put("success", result > 0);  // 삭제가 성공하면 true
	     return response;
	 }
	 
}
