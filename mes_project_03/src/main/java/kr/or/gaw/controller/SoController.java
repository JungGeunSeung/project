package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.service.BomService;

@Controller
public class SoController {

	@Autowired
	BomService bomService;
	
	/*
	 * @RequestMapping("/bom") public String bomin(Model model) { List<BomDTO> list
	 * = bomService.selectBom(); model.addAttribute("list", list); return
	 * "/main/bom"; }
	 */
	   @RequestMapping("/bom")
	    public String bomin(@RequestParam(defaultValue = "1") int page, Model model) {
	        int pageSize = 10;  // 한 페이지에 보여줄 항목 수
	        List<BomDTO> list = bomService.selectBomByPage(page, pageSize);
	        int totalCount = bomService.getBomCount();  // 총 레코드 수
	        int totalPages = (int) Math.ceil((double) totalCount / pageSize);  // 총 페이지 수

	        model.addAttribute("list", list);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);

	        return "main/bom";
	    }
}
