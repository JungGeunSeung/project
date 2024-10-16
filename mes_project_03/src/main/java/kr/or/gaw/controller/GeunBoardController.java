package kr.or.gaw.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.PostsDTO;
import kr.or.gaw.dto.ReplyDTO;
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
	public String boardCRU(BoardDTO dto, Model model, HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		int result = boardservice.boardDuplicate(dto.getBoard_id());
		int update = -1;
		int insert = -1;
		
		if (result >= 1) {
			dto.setCreated_by(loggedInUser.getUser_id());
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
		    dto.setCreated_by(loggedInUser.getUser_id());
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
	
	///////////////////////// 게시글 관련 /////////////////////////////////////////
	
	@RequestMapping("/allposts")
	public String allposts(Model model,
	                       @RequestParam(value = "board_id", required = false) String boardId,
	                       @RequestParam(value = "countPerPage", required = false) Integer countPerPage,
	                       @RequestParam(value = "page", required = false) Integer page,
	                       @RequestParam(value = "searchType", required = false) String searchType,
	                       @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {

	    // 기본값 설정
	    if (page == null) {
	        page = 1;
	    }
	    if (countPerPage == null) {
	        countPerPage = 20;
	    }
	    if (boardId == null || boardId.isEmpty()) {
	        boardId = "all";
	    }
	    if (searchType == null || searchType.isEmpty()) {
	        searchType = "all";
	    }
	    if (searchKeyword == null) {
	        searchKeyword = "";
	    }

	    // DTO 설정
	    PostsDTO dto = new PostsDTO();
	    dto.setPage(page);
	    dto.setCountPerPage(countPerPage);
	    dto.setSearchType(searchType);
	    dto.setSearchKeyword(searchKeyword);
	    dto.setBoard_id(boardId);

	    // 페이지 범위 계산
	    int startRow = (dto.getPage() - 1) * dto.getCountPerPage() + 1;
	    int endRow = dto.getPage() * dto.getCountPerPage();
	    dto.setStartRow(startRow);
	    dto.setEndRow(endRow);

	    // 게시물 목록 가져오기
	    List<PostsDTO> postList = boardservice.listPosts(dto);
	    List<PostsDTO> postList2 = boardservice.listPostsAnno(dto);
	    List<BoardDTO> boardList = boardservice.listBoard();
	    

	    // 총 게시물 수 계산
	    int totalPosts = boardservice.totalPostsWithSearch(dto) - postList2.size();
	    int totalPages = (int) Math.ceil((double) totalPosts / countPerPage);

	    // 페이지네이션 정보 계산
	    int displayPageCount = 5;
	    int startPage = Math.max(1, page - displayPageCount / 2);
	    int endPage = Math.min(totalPages, startPage + displayPageCount - 1);

	    boolean hasPrev = startPage > 1;
	    boolean hasNext = endPage < totalPages;
	    int prevPage = page - 1;
	    int nextPage = page + 1;

	    // 페이지네이션 정보를 모델에 추가
	    Map<String, Object> pagination = new HashMap();
	    pagination.put("currentPage", page);
	    pagination.put("totalPages", totalPages);
	    pagination.put("startPage", startPage);
	    pagination.put("endPage", endPage);
	    pagination.put("hasPrev", hasPrev);
	    pagination.put("hasNext", hasNext);
	    pagination.put("prevPage", prevPage);
	    pagination.put("countPerPage", countPerPage);
	    pagination.put("nextPage", hasNext ? nextPage : totalPages); // nextPage 값을 설정

	    // 모델에 데이터 추가
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("post", postList);
	    model.addAttribute("postAnno", postList2);
	    model.addAttribute("board", boardList);
	    model.addAttribute("searchType", searchType);
	    model.addAttribute("searchKeyword", searchKeyword);
	    model.addAttribute("board_id", boardId); // 게시판 필터 유지

	    return "bulletin/allposts";
	}


	
	@PostMapping("/post.ajax")
	@ResponseBody
	public Map<String, Object> getBoardData(
	        @RequestBody Map<String, String> requestData,
	        @RequestParam(value = "countPerPage", required = false) Integer countPerPage,
	        @RequestParam(value = "page", required = false) Integer page,
	        @RequestParam(value = "searchType", required = false) String searchType,
	        @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {

	    // 게시판 ID와 다른 파라미터 받기
	    String boardId = requestData.get("board_id");

	    // 기본값 설정
	    if (page == null) {
	        page = 1;
	    }
	    if (countPerPage == null) {
	        countPerPage = 10;
	    }
	    if (searchType == null) {
	        searchType = "all";
	    }
	    if (searchKeyword == null) {
	        searchKeyword = "";
	    }

	    // DTO 설정
	    PostsDTO dto = new PostsDTO();
	    dto.setPage(page);
	    dto.setCountPerPage(countPerPage);
	    dto.setSearchType(searchType);
	    dto.setSearchKeyword(searchKeyword);
	    dto.setBoard_id(boardId);

	    // 페이지 범위 설정
	    int startRow = (page - 1) * countPerPage + 1;
	    int endRow = page * countPerPage;
	    dto.setStartRow(startRow);
	    dto.setEndRow(endRow);

	    // 게시물 목록 가져오기 (게시판 필터 포함)
	    List<PostsDTO> list;
	    if ("all".equals(boardId)) {
	        list = boardservice.listPosts(dto); // 검색 조건 포함 전체 게시글 가져오기
	    } else {
	        list = boardservice.selectBoardByPost(boardId); // 특정 게시판 게시글 가져오기
	    }

	    // 응답 데이터 생성
	    Map<String, Object> response = new HashMap();
	    response.put("status", "success");
	    response.put("list", list);

	    return response; // JSON 형식으로 반환
	}


	
	// 게시글 하나 읽는 페이지
	 @GetMapping("/post.read")
	    public String readPost(@RequestParam("post_id") String postId, Model model) {
	        PostsDTO post = boardservice.selectPostById(postId); // 게시글 한개 뽑아 오기
	        List comments = boardservice.listComments(postId); // 그 게시글에 해당하는 댓글 뽑아오기
	        List reply = boardservice.listReply(); // 그 게시글의 해당하는 답글 뽑아 오기
	        boardservice.viewUp(postId); // 조회수 증가
	        model.addAttribute("post", post);
	        model.addAttribute("comments", comments);
	        model.addAttribute("reply", reply);
	        return "bulletin/postOne";
	    }
	 
	 // 게시글 수정 페이지 입장
	 @RequestMapping("/post.modify")
	 public String modifypost(Model model, @RequestParam("post_id") String postId, PostsDTO dto,
			 @RequestParam(value = "pinned", required = false, defaultValue = "false") boolean pinned) {
		 
		 dto = boardservice.selectPostById(postId);
		 List list = new ArrayList();
		 list = boardservice.listBoard();
		 model.addAttribute("dto", dto);
		 model.addAttribute("list", list);
		 return "bulletin/postModify";
	 }
	 
	 @RequestMapping("/post.modify.do")
	 public String modifypostDo(PostsDTO dto, @RequestParam("post_id") String postId,
			 @RequestParam(value = "pinned", required = false, defaultValue = "false") boolean pinned) {
		 
		 dto.setPost_id(postId);
		 
		 if(pinned) {
			 dto.setPinned("Y");
		 } else {
			 dto.setPinned("N");
		 }
		 Timestamp timestamp1 = new Timestamp(System.currentTimeMillis());
		 dto.setUpdated_at(timestamp1);
		 int result = boardservice.updatePost(dto);
		 return "redirect:post.read?post_id=" + dto.getPost_id();
	 }
	 
	 // 게시글 작성 페이지 입장
	 @RequestMapping("/post.insert")
	 public String insertpost(Model model) {
		 List list = boardservice.listBoard();
		 model.addAttribute("list", list);
		 return "bulletin/postInsert";
	 }
	 
	// 게시글 작성 로직
		 @RequestMapping("/post.insert.do")
		 public String insertpostDo(PostsDTO dto, 
				 @RequestParam(value = "pinned", required = false, defaultValue = "false") boolean pinned,
				 HttpSession session) {
			 
			 EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
			 
			 if(pinned) {
				 dto.setPinned("Y");
			 } else {
				 dto.setPinned("N");
			 }
			 
			 int maxnum = boardservice.maxPostId();
				if(maxnum < 10) {
					dto.setPost_id("P" + "00" + (maxnum+1));
				} else if (maxnum >= 10 && maxnum < 100) {
					dto.setPost_id("P" + "0" + (maxnum+1));
				} else if (maxnum >= 100) {
					dto.setPost_id("P" + (maxnum+1)); }
				
			 Timestamp timestamp1 = new Timestamp(System.currentTimeMillis());
			 dto.setUpdated_at(timestamp1);
			 dto.setAuthor_id(loggedInUser.getUser_id()); // 나중에 새션으로 값을 받아와 작성자를 바꿀 필요 있음
			 int result = boardservice.insertPost(dto);
			 return "redirect:post.read?post_id=" + dto.getPost_id();
		 }
	 
	 // 게시글 삭제하기
	 @RequestMapping("/post.delete")
	 public String deletepost(@RequestParam("post_id") String postId) {
		 int result = boardservice.deletePost(postId);
		 return "redirect:allposts";
	 }
	 
	 
	 
	 ///////////////////////// 댓글 관련 /////////////////////////////////////////
	 
	 // 댓글 등록
	 @RequestMapping("/comment.insert")
	 public String commentInsert(CommentsDTO dto, HttpSession session) {
		 EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		 LocalDateTime now = LocalDateTime.now(); // 현재 시간
		 Timestamp hireDate = Timestamp.valueOf(now); // LocalDateTime을 java.sql.Timestamp로 변환
		 	dto.setCreated_at(hireDate);
		    dto.setEmployee_id(loggedInUser.getUser_id());
		    
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
	 
	 //////// 답글관련 ////////////////////////////////////////////////////////////////////////////////
	 
	 @PostMapping("/reply.save")
	 @ResponseBody
	 public ResponseEntity<Map<String, Object>> saveReply(@RequestParam("comment_id") String commentId, 
	                                                      @RequestParam("content") String content) {
	     Map<String, Object> response = new HashMap();
	     
	     try {
	    	 ReplyDTO dto = new ReplyDTO();
		        dto.setComment_id(commentId);
		        dto.setContent(content);
		        dto.setUser_id("geun");
		        
		        
		        int maxnum = boardservice.maxReplyId();
				if(maxnum < 10) {
					dto.setReply_id("R" + "00" + (maxnum+1));
				} else if (maxnum >= 10 && maxnum < 100) {
					dto.setReply_id("R" + "0" + (maxnum+1));
				} else if (maxnum >= 100) {
					dto.setReply_id("R" + (maxnum+1)); }

				int result = boardservice.insertReply(dto);
	         response.put("success", true);
	         response.put("message", "답글이 성공적으로 저장되었습니다.");
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "답글 저장 중 오류가 발생했습니다.");
	     }
	     
	     return ResponseEntity.ok(response);
	 }
	 
 	 // 답글 삭제
	 @PostMapping("/reply.delete")
	 @ResponseBody
	 public Map<String, Object> deleteReply(@RequestBody Map<String, String> requestData) {
	     String reply_id = requestData.get("reply_id");

	     // 댓글 삭제 로직 (DB에서 삭제)
	     int result = boardservice.deleteReply(reply_id);  // 삭제된 행의 개수를 반환

	     // 응답 데이터 생성
	     Map<String, Object> response = new HashMap();
	     response.put("success", result > 0);  // 삭제가 성공하면 true
	     return response;
	 }
	 
	// 답글 수정
		 @PostMapping("/reply.update")
		 @ResponseBody
		 public Map<String, Object> updateReply(@RequestBody Map<String, String> requestData, ReplyDTO dto) {
		     
		     String reply_id = requestData.get("reply_id");
		     String content = requestData.get("content");
		     dto.setReply_id(reply_id);
		     dto.setContent(content);
		     
		     // 답글 업데이트 로직
		     int result = boardservice.updateReply(dto);
		     
		     // 1 이상이면 true, 그렇지 않으면 false
		     boolean success = (result > 0);
		     
		     // 응답 데이터
		     Map<String, Object> response = new HashMap();
		     response.put("success", success);
		     
		     return response;  // 반드시 JSON 형식으로 반환
		 }
	 
}
