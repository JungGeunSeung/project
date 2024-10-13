package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.dto.CommentsDTO;
import kr.or.gaw.dto.PostsDTO;

@Mapper
public interface BoardDAO {
	
	List listBoard();
	BoardDTO boardOne(String user_id);
	int insertBoard(BoardDTO dto);
	int updateBoard(BoardDTO dto);
	int deleteBoard(String board_id);
	int boardDuplicate(String board_id);
	int maxBoardID();
	List listPosts(PostsDTO dto);
	PostsDTO selectPostById(String postId);
	List listComments(String post_id);
	int insertComment(CommentsDTO dto);
	int maxCommentsId();
	int updateComment(CommentsDTO dto);
	int deleteComment(String comment_id);
	int totalPosts();
	int totalPostsWithSearch(PostsDTO dto);
}
