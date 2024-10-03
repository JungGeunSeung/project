package kr.or.gaw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeunController {
	
	@RequestMapping("/main")
	public String main() {
		return "main/mainpage";
	}
	
}
