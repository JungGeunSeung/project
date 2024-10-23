package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.WorkOrderDTO;

public interface OrderService {

	List<WorkOrderDTO> selectOrder();
	int deleteOrder(String orderId);
	int createWorkOrder(WorkOrderDTO workOrderDTO);
}
