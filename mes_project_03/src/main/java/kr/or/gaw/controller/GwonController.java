package kr.or.gaw.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.PlanDTO;
import kr.or.gaw.dto.WorkOrderDTO;
import kr.or.gaw.service.OrderService;
import kr.or.gaw.service.PlanService;

@Controller
public class GwonController {
	
	@Autowired
	PlanService planService;
	
	@RequestMapping("/selectPlan")
	@ResponseBody
	public List<PlanDTO> selectPlan() {
		List<PlanDTO> list = planService.selectPlan();
		System.out.println("생산계획 컨트롤러 list.size() : "+list.size());
		
		return list;
	}
	
	@RequestMapping("/plan")
	public String plan(HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	      if (loggedInUser == null) {
	           return "redirect:/login";       }
	      
		return "/plan/plan";
	}
	
	@RequestMapping(value="/deletePlan", method=RequestMethod.DELETE)
	@ResponseBody
	public int deletePlan(@RequestBody PlanDTO dto) {
		int result = planService.deletePlan(dto);
		System.out.println("삭제결과" +result);
		return result;
	}
	
	 // 생산 계획 생성
    @RequestMapping(value = "/createPlan", method = RequestMethod.POST)
    @ResponseBody
    public int createPlan(@RequestBody PlanDTO dto) {
        int result = planService.createPlan(dto);
        System.out.println("생산계획 생성 결과: " + result);
        return result;
    }

    // 생산 계획 수정
    @RequestMapping(value = "/updatePlan", method = RequestMethod.PUT)
    @ResponseBody
    public int updatePlan(@PathVariable("plan_id") String planId, @RequestBody PlanDTO dto) {
        dto.setPlan_id(planId);
        int result = planService.updatePlan(dto);
        System.out.println("생산계획 수정 결과: " + result);
        return result;
    }
	
    @Autowired
    OrderService orderService; // 서비스 추가
    
    // 작업지시서 생성
    @RequestMapping(value = "/createWorkOrder", method = RequestMethod.POST)
    @ResponseBody
    public int createWorkOrder(@RequestBody WorkOrderDTO workOrderDTO) {
    	String orderId = UUID.randomUUID().toString();
        workOrderDTO.setOrder_id(orderId); // 생성된 ORDER_ID를 DTO에 설정
        
        int result = orderService.createWorkOrder(workOrderDTO);
        System.out.println("작업지시서 생성 결과: " + result);
        return result;
    }


}
