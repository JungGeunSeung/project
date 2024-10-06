package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.service.EmpService;


@Controller
public class GeunController {
	
	@Autowired
	EmpService empService;
	
	@RequestMapping("/main")
	public String main(Model model) {
		List<EmpDTO> list = empService.listEmp();
		model.addAttribute("list",list);
		return "main/mainpage";
	}
	
}
