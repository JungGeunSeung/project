package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.service.BomService;

@Controller
public class SoController {

	@Autowired
	BomService bomService;

	@RequestMapping("/bom")
	public String selectBomList(BomDTO dto, Model model, @RequestParam(value = "page", defaultValue = "1") Integer page,
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
		model.addAttribute("countperpage", countperpage); // countperpage를 모델에 추가

		return "bom/bom"; // JSP 파일 경로가 올바르게 설정되었는지 확인하세요.
	}

	@RequestMapping("/bomupdate")
	public String selectBomList(@RequestParam("bom_id") String bom_id, Model model) {
	    BomDTO bomDTO = bomService.selectOne(bom_id);
	    model.addAttribute("bomDTO", bomDTO);
	    return "bom/bomupdate";
	}
	@RequestMapping(value = "/bomupdate/update", method = RequestMethod.POST)
	public String updateBom(BomDTO bomDTO) {
	    // 업데이트 로직 처리
	    bomService.updateBom(bomDTO); // 서비스 레이어에서 업데이트 처리
	    return "redirect:/bom"; // 업데이트 후 목록 페이지로 리다이렉트
	}
	
	@RequestMapping("/bominsert")
	public String insertBom(Model model) {
	    return "bom/bominsert";
	}
	@RequestMapping(value = "/bominsert/insert", method = RequestMethod.POST)
	public String inserBomDo(BomDTO bomDTO) {
		System.out.println("컨트롤러 실행");
	    bomService.insertBom(bomDTO); // 서비스 레이어에서 업데이트 처리
	    return "redirect:/bom"; // 업데이트 후 목록 페이지로 리다이렉트
	}
	@RequestMapping("/bomdelete")
	public String inserBomDo(@RequestParam("bom_id") String bom_id) {
		System.out.println("딜리트 컨트롤러 실행");
	    bomService.deleteBom(bom_id); // 서비스 레이어에서 업데이트 처리
	    return "redirect:/bom"; // 업데이트 후 목록 페이지로 리다이렉트
	}
}
