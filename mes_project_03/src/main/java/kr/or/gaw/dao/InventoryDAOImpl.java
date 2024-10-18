package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.InventoryDTO;

@Repository
public class InventoryDAOImpl implements InventoryDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String namespace = "kr.or.gaw.dao.InventoryDAO";

    @Override
    public List<InventoryDTO> selectInventoryList(InventoryDTO dto) {
        return sqlSession.selectList(namespace + ".selectInventoryList", dto);
    }

    @Override
    public List<InventoryDTO> selectAll() {
        return sqlSession.selectList(namespace + ".selectAll");
    }

    @Override
    public InventoryDTO selectById(String inventoryId) {
        return sqlSession.selectOne(namespace + ".selectById", inventoryId);
    }

    @Override
    public void insert(InventoryDTO inventoryDTO) {
        sqlSession.insert(namespace + ".insert", inventoryDTO);
    }

    @Override
    public void update(InventoryDTO inventoryDTO) {
        sqlSession.update(namespace + ".update", inventoryDTO);
    }

    @Override
    public void delete(String inventoryId) {
        sqlSession.delete(namespace + ".delete", inventoryId);
    }

    @Override
    public int getTotalDataCount(InventoryDTO dto) {
        return sqlSession.selectOne(namespace + ".getTotalDataCount", dto);
    }
}
