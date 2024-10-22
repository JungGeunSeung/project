package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.OrderDAO;
import kr.or.gaw.dto.WorkOrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public List<WorkOrderDTO> selectOrder(){
		List list = orderDAO.selectOrder();
		return list;
	}
	// 삭제 메서드
    @Override
    public int deleteOrder(String orderId) {
        System.out.println("삭제 "+orderId);

        return orderDAO.deleteOrder(orderId);
    }


}
