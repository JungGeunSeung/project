package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.MaterialDTO;

@Repository
public class MaterialDAOImpl implements MaterialDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String namespace = "kr.or.gaw.dao.MaterialDAO";

    @Override
    public List<MaterialDTO> selectMaterialList(MaterialDTO dto) {
        return sqlSession.selectList(namespace + ".selectMaterialList", dto);
    }

    @Override
    public List<MaterialDTO> selectAll() {
        return sqlSession.selectList(namespace + ".selectAll");
    }

    @Override
    public MaterialDTO selectById(String materialId) {
        return sqlSession.selectOne(namespace + ".selectById", materialId);
    }

    @Override
    public void insert(MaterialDTO materialDTO) {
        sqlSession.insert(namespace + ".insert", materialDTO);
    }

    @Override
    public void update(MaterialDTO materialDTO) {
        sqlSession.update(namespace + ".update", materialDTO);
    }

    @Override
    public void delete(String materialId) {
        sqlSession.delete(namespace + ".delete", materialId);
    }

    @Override
    public int getTotalDataCount(MaterialDTO dto) {
        return sqlSession.selectOne(namespace + ".getTotalDataCount", dto);
    }
}
