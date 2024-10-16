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
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SqlSession sqlSession;

	

}
