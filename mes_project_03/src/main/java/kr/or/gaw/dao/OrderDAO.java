package kr.or.gaw.dao;

import java.util.List;


import kr.or.gaw.dto.WorkOrderDTO;

public interface OrderDAO {
	List<WorkOrderDTO>selectOrder();
	int deleteOrder(String orderId);
	int createWorkOrder(WorkOrderDTO workOrderDTO);
	
}