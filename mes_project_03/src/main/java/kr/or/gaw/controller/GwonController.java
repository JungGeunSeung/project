package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.PlanDTO;
import kr.or.gaw.service.PlanService;

@Controller
public class GwonController {
	
	@Autowired
	PlanService planService;
	
	@RequestMapping("/selectPlan")
	@ResponseBody
	public List selectPlan() {
		List<PlanDTO> list = planService.selectPlan();
		System.out.println("생산계획 컨트롤러 list.size() : "+list.size());
		
		return list;
	}
	
	@RequestMapping("/plan")
	public String plan() {
		return "main/plan";
	}
	
	@RequestMapping(value="/deletePlan", method=RequestMethod.DELETE)
	@ResponseBody
	public int deletePlan(@RequestBody PlanDTO dto) {
		System.out.println();
		int result = planService.deletePlan(dto);
		
		return -1;
	}
	

}
