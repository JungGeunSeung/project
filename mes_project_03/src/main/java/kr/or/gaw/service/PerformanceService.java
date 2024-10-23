package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.PerformanceDTO;

public interface PerformanceService {

	List<PerformanceDTO> selectPerformance();
	public int deletePerformance(PerformanceDTO dto);
	int insertPerformance(PerformanceDTO performanceDTO);
}
