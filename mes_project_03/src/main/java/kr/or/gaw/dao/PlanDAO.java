package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.PlanDTO;

@Mapper
public interface PlanDAO {

	List<PlanDTO> selectPlan();
	public int deletePlan(PlanDTO dto);
	public int createPlan(PlanDTO dto);
	public int updatePlan(PlanDTO dto);
}
