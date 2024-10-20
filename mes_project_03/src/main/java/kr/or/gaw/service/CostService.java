package kr.or.gaw.service;

import java.util.List;
import kr.or.gaw.dto.CostDTO;

public interface CostService {

    // Read (원가 목록 조회)
    List<CostDTO> selectCostList(CostDTO dto, int offset, int countperpage);

    // 총 데이터 수 가져오기
    int getTotalDataCount(CostDTO dto);

    // Create (새로운 원가 생성)
    void insertCost(CostDTO cost);

    // Update (기존 원가 수정)
    void updateCost(CostDTO cost);

    // Complete (원가 완료 처리)
    void completeCost(String cost_id);
}
