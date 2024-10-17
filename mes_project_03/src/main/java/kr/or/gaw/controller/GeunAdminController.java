package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.service.EmpService;

@Controller
public class GeunAdminController {
	
	@Autowired
	EmpService empservice;
	
	@RequestMapping("/adminpage")
	public String adminIn(Model model) {
		List list = empservice.filterListEmp();
		List list1 = empservice.deptList();
		model.addAttribute("emplist", list);
		model.addAttribute("deptlist", list1);
		return "main/adminPage";
	}
	
	@PostMapping("/empUpdate.do")
	public String adminUpdate(EmpDTO dto) {
		int result = empservice.empUpdateToAdmin(dto);
		return "redirect:adminpage";
	}
}
