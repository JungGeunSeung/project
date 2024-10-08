package kr.or.gaw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.gaw.service.EmpService;

@Controller
public class SoController {

	@Autowired
	EmpService empService;
	
	
}
