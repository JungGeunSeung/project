package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gaw.dto.PlanDTO;

@Repository
public class PlanDAOImpl implements PlanDAO  {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<PlanDTO> selectPlan() {
		List list = sqlSession.selectList("kr.or.gaw.dao.PlanDAO.selectPlan");
		System.out.println("dao들어옴"+list.size());
		return list; 
	}
	
	@Override
	public int deletePlan(PlanDTO dto) {
		int result = sqlSession.delete("kr.or.gaw.dao.PlanDAO.deletePlan",dto);
		System.out.println("dao delete결과 :"+ result);
		return result;
	}
	
}
