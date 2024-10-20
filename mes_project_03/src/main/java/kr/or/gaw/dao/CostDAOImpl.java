package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.gaw.dto.CostDTO;

@Repository
public class CostDAOImpl implements CostDAO {

    private static final String NAMESPACE = "kr.or.gaw.mapper.CostMapper";

    @Autowired
    private SqlSession sqlSession;

    // Read (원가 목록 조회)
    @Override
    public List<CostDTO> selectCostList(CostDTO dto, int offset, int countperpage) {
        return sqlSession.selectList(NAMESPACE + ".selectCostList", dto, new org.apache.ibatis.session.RowBounds(offset, countperpage));
    }

    // 총 데이터 수 가져오기
    @Override
    public int getTotalDataCount(CostDTO dto) {
        return sqlSession.selectOne(NAMESPACE + ".getTotalDataCount", dto);
    }

    // Create (새로운 원가 생성)
    @Override
    public void insertCost(CostDTO cost) {
        sqlSession.insert(NAMESPACE + ".insertCost", cost);
    }

    // Update (기존 원가 수정)
    @Override
    public void updateCost(CostDTO cost) {
        sqlSession.update(NAMESPACE + ".updateCost", cost);
    }

    // Complete (원가 완료 처리)
    @Override
    public void completeCost(String cost_id) {
        sqlSession.update(NAMESPACE + ".completeCost", cost_id);
    }
}
