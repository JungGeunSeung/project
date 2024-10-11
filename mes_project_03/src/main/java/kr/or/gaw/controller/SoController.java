package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.service.BomService;

@Controller
public class SoController {

	@Autowired
	BomService bomService;
     
	@RequestMapping("/bom")
    public String selectBomList(BomDTO dto, Model model,
                                @RequestParam(value = "page", defaultValue = "1") Integer page,
                                @RequestParam(value = "countperpage", defaultValue = "10") Integer countperpage) {

        dto.setPage(page);
        dto.setCountperpage(countperpage);
        List<BomDTO> list = bomService.selectBomList(dto);

        if (list != null) {
            System.out.println("List Size : " + list.size());
        } else {
            System.out.println("List is null");
        }
        
        int totalDataCount = bomService.getTotalDataCount(dto); // 전체 데이터 개수를 가져오는 로직 추가
        int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);
        
     // 동적 페이지 범위 계산
        int startPage = Math.max(1, page - 3);
        int endPage = Math.min(totalPage, page + 3);
        
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("bom", list);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "bom/bom";
    }
	
}
