package kr.or.gaw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.PerformanceDTO;
import kr.or.gaw.dto.WorkOrderDTO;
import kr.or.gaw.service.OrderService;
import kr.or.gaw.service.PerformanceService;

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
	public String plan(HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	      if (loggedInUser == null) {
	           return "redirect:/login";       }
		return "/plan/workorder";
	}
	
	// 삭제 요청을 처리하는 메서드
    @RequestMapping("/deleteOrder/{orderId}")
    @ResponseBody
    public String deleteOrder(HttpSession session, @PathVariable("orderId") String orderId) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	      if (loggedInUser == null) {
	           return "redirect:/login";       }
	    
        int result = orderService.deleteOrder(orderId);
        System.out.println("삭제 "+orderId);
        if (result > 0) {
            return "success";
        } else {
            return "failure";
        }
    }
    
    

    @Autowired
    PerformanceService performanceService; 
	
 // 작업 완료 시 performance 테이블에 데이터를 저장하는 메서드
    @RequestMapping(value = "/completeOrder", method = RequestMethod.POST)
    @ResponseBody
    public String completeOrder(HttpSession session, @RequestBody PerformanceDTO performanceDTO) {
        EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }
        
        int result = performanceService.insertPerformance(performanceDTO); // PerformanceService를 호출하여 작업 완료 처리
        if (result > 0) {
            return "success";
        } else {
            return "failure";
        }
    }
	
}
