package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.gaw.dto.WorkOrderDTO;


public class OrderDAOImpl implements OrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<WorkOrderDTO> selectOrder(){
		List<WorkOrderDTO> list = sqlSession.selectList("kr.or.gaw.dao.OrderDAO.selectOrder");
		return list;
	}
	
	// 삭제 메서드
    public int deleteOrder(String orderId) {
        System.out.println("삭제 "+orderId);

        return sqlSession.delete("kr.or.gaw.dao.OrderDAO.deleteOrder", orderId);
    }

}
