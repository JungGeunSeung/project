package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.PlanDTO;

public interface PlanService {

	List<PlanDTO> selectPlan();
	public int deletePlan(PlanDTO dto);
	public int createPlan(PlanDTO dto);
	public int updatePlan(PlanDTO dto);
}
