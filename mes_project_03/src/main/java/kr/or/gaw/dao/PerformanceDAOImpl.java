package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.PerformanceDTO;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PerformanceDTO> selectPerformance(){
		List list = sqlSession.selectList("kr.or.gaw.dao.PerformanceDAO.selectPerformance");
		System.out.println("per dao 들어옴 : "+list.size());
		return list;
	}
	
	@Override
	public int deletePerformance(PerformanceDTO dto) {
		int result = sqlSession.delete("kr.or.gaw.dao.PerformanceDAO.deletePerformance");
		System.out.println("per delet : "+result);
		return result;
	}
	
	// performance 테이블에 데이터를 삽입하는 메서드
    public int insertPerformance(PerformanceDTO performanceDTO) {
        return sqlSession.insert("kr.or.gaw.dao.PerformanceDAO.insertPerformance", performanceDTO);
    }
}
