package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.WorkOrderDTO;
import kr.or.gaw.service.OrderService;

@Controller
public class GwonWorkOrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/selectOrder")
	@ResponseBody
	public List<WorkOrderDTO> selectOrder() {  
	    List<WorkOrderDTO> list = orderService.selectOrder(); 
	    System.out.println("생산계획 컨트롤러 list.size() : " + list.size());
	    
	    return list;
	}
	
	@RequestMapping("/order")
	public String plan() {
		return "/plan/workorder";
	}
	
//	@RequestMapping(value="/deletePlan", method=RequestMethod.DELETE)
//	@ResponseBody
//	public int deletePlan(@RequestBody PlanDTO dto) {
//		System.out.println();
//		int result = planService.deletePlan(dto);
//		
//		return -1;
//	}
//	
//	 // 생산 계획 생성
//    @RequestMapping(value = "/createPlan", method = RequestMethod.POST)
//    @ResponseBody
//    public int createPlan(@RequestBody PlanDTO dto) {
//        int result = planService.createPlan(dto);
//        System.out.println("생산계획 생성 결과: " + result);
//        return result;
//    }
//
//    // 생산 계획 수정
//    @RequestMapping(value = "/updatePlan/{plan_id}", method = RequestMethod.PUT)
//    @ResponseBody
//    public int updatePlan(@PathVariable("plan_id") String planId, @RequestBody PlanDTO dto) {
//        dto.setPlan_id(planId);
//        int result = planService.updatePlan(dto);
//        System.out.println("생산계획 수정 결과: " + result);
//        return result;
//    }
	
}
