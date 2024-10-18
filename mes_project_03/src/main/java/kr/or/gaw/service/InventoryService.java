package kr.or.gaw.service;

import java.util.List;
import kr.or.gaw.dto.InventoryDTO;

public interface InventoryService {

    List<InventoryDTO> selectAll();  // 모든 인벤토리 조회

    InventoryDTO selectById(String inventoryId);  // 특정 인벤토리 조회

    void insert(InventoryDTO inventoryDTO);  // 새로운 인벤토리 추가

    void update(InventoryDTO inventoryDTO);  // 인벤토리 업데이트

    void delete(String inventoryId);  // 인벤토리 삭제

    List<InventoryDTO> selectInventoryList(InventoryDTO dto);  // 페이징된 인벤토리 목록 조회

    int getTotalDataCount(InventoryDTO dto);  // 페이징을 위한 총 데이터 수 계산
}
