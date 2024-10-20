package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.gaw.dto.CostDTO;

@Mapper
public interface CostDAO {

    // Read (원가 목록 조회, 페이징 처리 포함)
    List<CostDTO> selectCostList(@Param("dto") CostDTO dto, @Param("offset") int offset, @Param("countperpage") int countperpage);

    // 총 데이터 수 가져오기 (페이징 처리를 위한 메서드)
    int getTotalDataCount(CostDTO dto);

    // Create (새로운 원가 생성)
    void insertCost(CostDTO cost);

    // Update (기존 원가 수정)
    void updateCost(CostDTO cost);

    // Complete (원가 완료 처리)
    void completeCost(String cost_id);
}
