package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.gaw.dto.WorkOrderDTO;

public class OrderImpl implements OrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<WorkOrderDTO> selectOrder(){
		List<WorkOrderDTO> list = sqlSession.selectList("kr.or.gaw.dao.OrderDAO.selectOrder");
		return list;
	}
}
