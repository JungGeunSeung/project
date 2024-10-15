package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.PerformanceDAO;
import kr.or.gaw.dto.PerformanceDTO;
import kr.or.gaw.dto.PlanDTO;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	@Autowired
	PerformanceDAO performanceDAO;
	
	@Override
	public List<PerformanceDTO> selectPerformance() {
		List list = performanceDAO.selectPerformance();
		System.out.println("Performance서비스 들어옴"+list.size());
		return list;
	}
	
	@Override
	public int deletePerformance(PerformanceDTO dto) {
		int result = performanceDAO.deletePerformance(dto);
		System.out.println("서비스 deletePerformance : "+result);
		return result;
	}
}
