package kr.or.gaw.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.gaw.service.EmpService;


@Controller
public class GeunController {
	
	@Autowired
	EmpService empService;
	
	@RequestMapping("/main")
	public String main() {
		return "main/mainpage";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "main/login";
	}
	
	@RequestMapping("/agreement")
	public String agree() {
		return "main/agreement";
	}

	@RequestMapping("/sign")
	public String sign() {
		return "main/sign";
	}
	
	@RequestMapping("/sign.do")
	public String signRun() {
		
		return "main/sign";
	}
	
}
