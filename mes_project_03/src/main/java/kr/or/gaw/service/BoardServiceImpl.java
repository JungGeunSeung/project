package kr.or.gaw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BoardDAO;
import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.dto.CommentsDTO;
import kr.or.gaw.dto.PostsDTO;
import kr.or.gaw.dto.ReplyDTO;

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

	@Override
	public List listPosts(PostsDTO dto) {
		return boardDAO.listPosts(dto);
	}

	@Override
	public PostsDTO selectPostById(String postId) {
		return boardDAO.selectPostById(postId);
	}

	@Override
	public List listComments(String post_id) {
		return boardDAO.listComments(post_id);
	}

	@Override
	public int insertComment(CommentsDTO dto) {

		return boardDAO.insertComment(dto);
	}

	@Override
	public int maxCommentsId() {
		return boardDAO.maxCommentsId();
	}

	@Override
	public int updateComment(CommentsDTO dto) {
		return boardDAO.updateComment(dto);
	}

	@Override
	public int deleteComment(String comment_id) {
		int result = -1;
		result = boardDAO.deleteComment(comment_id);
		return result;
	}

	@Override
	public int totalPosts() {
		
		return boardDAO.totalPosts();
	}

	@Override
	public int totalPostsWithSearch(PostsDTO dto) {
		return boardDAO.totalPostsWithSearch(dto);
	}

	@Override
	public List selectBoardByPost(String board_id) {
		return boardDAO.selectBoardByPost(board_id);
	}

	@Override
	public int deletePost(String post_id) {
		return boardDAO.deletePost(post_id);
	}

	@Override
	public int updatePost(PostsDTO dto) {
		return boardDAO.updatePost(dto);
	}

	@Override
	public int insertReply(ReplyDTO dto) {
		return boardDAO.insertReply(dto);
	}

	@Override
	public int updateReply(ReplyDTO dto) {
		return boardDAO.updateReply(dto);
	}

	@Override
	public List listReply() {
		return boardDAO.listReply();
	}

	@Override
	public int deleteReply(String reply_id) {
		return boardDAO.deleteReply(reply_id);
	}

	@Override
	public int maxReplyId() {
		return boardDAO.maxReplyId();
	}

	@Override
	public int insertPost(PostsDTO dto) {
		return boardDAO.insertPost(dto);
	}

	@Override
	public int maxPostId() {
		return boardDAO.maxPostId();
	}

	@Override
	public void viewUp(String post_id) {
		boardDAO.viewUp(post_id);
	}

	@Override
	public List listPostsAnno(PostsDTO dto) {
		return boardDAO.listPostsAnno(dto);
	}

	@Override
	public List mainNewPosts() {
		return boardDAO.mainNewPosts();
	}


}
