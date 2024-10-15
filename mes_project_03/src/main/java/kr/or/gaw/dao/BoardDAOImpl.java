package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.BoardDTO;
import kr.or.gaw.dto.CommentsDTO;
import kr.or.gaw.dto.PostsDTO;
import kr.or.gaw.dto.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	BoardDTO boardDTO;
	
	
	// 전체 리스트 뽑기
	@Override
	public List listBoard() {
		
		List<BoardDTO> result = sqlSession.selectList("kr.or.gaw.dao.BoardDAO.listBoard");
		return result;
	}
	// 중복 검사
	@Override
	public int boardDuplicate(String board_id) {
		int result = -1;
		result = sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.boardDuplicate", board_id);
		return result;
	}
	
	@Override
	public int maxBoardID() {
		int result = -1;
		result = sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.maxBoardID");
		return result;
	}

	// 하나만 고르기
	@Override
	public BoardDTO boardOne(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 추가하기
	@Override
	public int insertBoard(BoardDTO dto) {
		int result = -1;
		result = sqlSession.insert("kr.or.gaw.dao.BoardDAO.insertBoard", dto);
		return result;
	}

	// 수정하기
	@Override
	public int updateBoard(BoardDTO dto) {
		int result = -1;
		result = sqlSession.update("kr.or.gaw.dao.BoardDAO.updateBoard", dto);
		return result;
	}

	// 삭제하기
	@Override
	public int deleteBoard(String board_id) {
		int result = -1;
		result = sqlSession.delete("kr.or.gaw.dao.BoardDAO.deleteBoard", board_id);
		return result;
	}
	
	////////////////////////////////// 게시글 관련 메소드
	@Override
	public List listPosts(PostsDTO dto) {
		return sqlSession.selectList("kr.or.gaw.dao.BoardDAO.listPosts", dto);
	}
	// 게시글 읽기
	@Override
    public PostsDTO selectPostById(String postId) {
        return sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.postOne", postId);
    }
	
	// 게시글에 있는 댓글 가져오기
	@Override
	public List listComments(String post_id) {
		return sqlSession.selectList("kr.or.gaw.dao.BoardDAO.listComments", post_id);
	}

	// 댓글 등록하기
	@Override
	public int insertComment(CommentsDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.BoardDAO.insertComment", dto);
	}
	@Override
	public int maxCommentsId() {
		int result = -1;
		result = sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.maxCommentsId");
		return result;
	}
	@Override
	public int updateComment(CommentsDTO dto) {
		int result = -1;
		result = sqlSession.update("kr.or.gaw.dao.BoardDAO.updateComment", dto);
		return result;
	}
	@Override
	public int deleteComment(String comment_id) {
		int result = -1;
		result = sqlSession.delete("kr.or.gaw.dao.BoardDAO.deleteComment", comment_id);
		return result;
	}
	@Override
	public int totalPosts() {
		
		return sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.totalPosts");
	}
	@Override
	public int totalPostsWithSearch(PostsDTO dto) {
		
		return sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.totalPostsWithSearch", dto);
	}
	@Override
	public List selectBoardByPost(String board_id) {
		return sqlSession.selectList("kr.or.gaw.dao.BoardDAO.selectBoardByPost", board_id);
	}
	@Override
	public int deletePost(String post_id) {
		return sqlSession.delete("kr.or.gaw.dao.BoardDAO.deletePost", post_id);
	}
	@Override
	public int updatePost(PostsDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.BoardDAO.updatePost", dto);
	}
	@Override
	public int insertReply(ReplyDTO dto) {
		
		return sqlSession.insert("kr.or.gaw.dao.BoardDAO.insertReply", dto);
	}
	@Override
	public int updateReply(ReplyDTO dto) {
		return sqlSession.update("kr.or.gaw.dao.BoardDAO.updateReply", dto);
	}
	@Override
	public List listReply() {
		return sqlSession.selectList("kr.or.gaw.dao.BoardDAO.listReply");
	}
	@Override
	public int deleteReply(String reply_id) {
		return sqlSession.delete("kr.or.gaw.dao.BoardDAO.deleteReply", reply_id);
	}
	@Override
	public int maxReplyId() {
		return sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.deleteReply");
	}
	@Override
	public int insertPost(PostsDTO dto) {
		return sqlSession.insert("kr.or.gaw.dao.BoardDAO.insertPost", dto);
	}
	@Override
	public int maxPostId() {
		return sqlSession.selectOne("kr.or.gaw.dao.BoardDAO.maxPostId");
	}

}
