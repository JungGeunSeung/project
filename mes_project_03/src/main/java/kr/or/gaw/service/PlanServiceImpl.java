package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.PlanDAO;
import kr.or.gaw.dto.PlanDTO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	PlanDAO planDAO;
	
	@Override
	public List<PlanDTO> selectPlan() {
		List list = planDAO.selectPlan();
		System.out.println("서비스 들어옴"+list.size());
		return list;
	}
	
	@Override
	public int deletePlan(PlanDTO dto) {
		int result = planDAO.deletePlan(dto);
		System.out.println("서비스 deletePlan : "+result);
		return result;
	}
	
	@Override
	public int createPlan(PlanDTO dto) {
		int result = planDAO.createPlan(dto);
		return result;
	}
	@Override
	public int updatePlan(PlanDTO dto) {
		int result = planDAO.updatePlan(dto);
		return result;
	}
}

