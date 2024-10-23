package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.PerformanceDTO;

@Mapper
public interface PerformanceDAO {

	List<PerformanceDTO> selectPerformance();
	public int deletePerformance(PerformanceDTO dto);
	int insertPerformance(PerformanceDTO performanceDTO);
}
