package kr.or.gaw.dao;

import java.util.List;

import kr.or.gaw.dto.PerformanceDTO;

public interface PerformanceDAO {

	List<PerformanceDTO> selectPerformance();
	public int deletePerformance(PerformanceDTO dto);
}
