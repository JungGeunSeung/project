package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.InventoryDTO;

public interface InventoryService {

	 List<InventoryDTO> selectAll();  // 모든 재고 조회

	    InventoryDTO selectById(String inventoryId);  // 특정 재고 조회

	    void insert(InventoryDTO inventoryDTO);  // 새로운 재고 추가

	    void update(InventoryDTO inventoryDTO);  // 재고 업데이트

	    void delete(String inventoryId);  // 재고 삭제
}
