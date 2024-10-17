package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.StandardDTO;
import kr.or.gaw.service.StandardService;

@Controller
public class AllController {
	
	@Autowired
	StandardService standardServie;
	
	@RequestMapping("/selectStandard")
	@ResponseBody
	public List<StandardDTO> selectStandard(){
		List<StandardDTO> list = standardServie.selectStandard();
		
		return list;
	}
	
	@RequestMapping("/standard")
	public String standard() {
		return "quality/standard";
	}

}


