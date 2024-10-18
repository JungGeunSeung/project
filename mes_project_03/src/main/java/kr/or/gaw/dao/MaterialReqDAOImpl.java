package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.gaw.dto.RequestDTO;

@Repository
public class MaterialReqDAOImpl implements MaterialReqDAO {

    @Autowired
    private SqlSession sqlSession;

    private static final String namespace = "kr.or.gaw.dao.MaterialReqDAO";

    @Override
    public List<RequestDTO> selectAll() {
        return sqlSession.selectList(namespace + ".selectAll");
    }

    @Override
    public RequestDTO selectById(String request_id) {
        return sqlSession.selectOne(namespace + ".selectById", request_id);
    }

    @Override
    public void insertRequest(RequestDTO request) {
        sqlSession.insert(namespace + ".insertRequest", request);
    }

    @Override
    public void updateRequest(RequestDTO request) {
        sqlSession.update(namespace + ".updateRequest", request);
    }

    @Override
    public void endRequest(String request_id) {
        sqlSession.update(namespace + ".endRequest", request_id);
    }

    @Override
    public int selectTotalRequestCount(RequestDTO dto) {
        return sqlSession.selectOne(namespace + ".selectTotalRequestCount", dto);
    }

    @Override
    public List<RequestDTO> selectRequestsByPage(RequestDTO dto) {
        return sqlSession.selectList(namespace + ".selectRequestsByPage", dto);
    }
}
