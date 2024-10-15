package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.PerformanceDTO;
import kr.or.gaw.service.PerformanceService;

@Controller
public class GwonPerformanceController {
	
	@Autowired
	PerformanceService performanceService;
	
	@RequestMapping("/selectPerformance")
	@ResponseBody
	public List selectPerformance() {
		List<PerformanceDTO> list = performanceService.selectPerformance();
		System.out.println("생산실적 컨트롤러 list.size() : "+list.size());
		
		return list;
	}
	
	@RequestMapping("/performance")
	public String plan() {
		return "/plan/performance";
	}
	
	@RequestMapping(value="/deletePerformance", method=RequestMethod.DELETE)
	@ResponseBody
	public int deletePerformance(@RequestBody PerformanceDTO dto) {
		System.out.println();
		int result = performanceService.deletePerformance(dto);
		
		return -1;
	}
	
}
