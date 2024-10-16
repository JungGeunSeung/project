package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.WorkOrderDTO;

public interface OrderDAO {
	List<WorkOrderDTO>selectOrder();
}
