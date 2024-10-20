package kr.or.gaw.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.gaw.dto.CostDTO;
import kr.or.gaw.dao.CostDAO;

@Service
public class CostServiceImpl implements CostService {

    @Autowired
    private CostDAO costDAO;

    // Read (원가 목록 조회)
    @Override
    public List<CostDTO> selectCostList(CostDTO dto, int offset, int countperpage) {
        return costDAO.selectCostList(dto, offset, countperpage);
    }

    // 총 데이터 수 가져오기
    @Override
    public int getTotalDataCount(CostDTO dto) {
        return costDAO.getTotalDataCount(dto);
    }

    // Create (새로운 원가 생성)
    @Override
    public void insertCost(CostDTO cost) {
        costDAO.insertCost(cost);
    }

    // Update (기존 원가 수정)
    @Override
    public void updateCost(CostDTO cost) {
        costDAO.updateCost(cost);
    }

    // Complete (원가 완료 처리)
    @Override
    public void completeCost(String cost_id) {
        costDAO.completeCost(cost_id);
    }
}
