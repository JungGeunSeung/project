package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.dto.MaterialDTO;
import kr.or.gaw.service.BomService;

@Controller
public class SoController {

	@Autowired
	BomService bomService;
	// BOM 목록 가져오기
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

		int totalDataCount = bomService.getTotalDataCount(dto);
		int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);

		// 동적 페이지 범위 계산
		int startPage = Math.max(1, page - 3);
		int endPage = Math.min(totalPage, page + 3);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("currentPage", page);
		model.addAttribute("bom", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("countperpage", countperpage);

		return "bom/bom";
	}
	// BOM 상세 페이지
	@RequestMapping("/bomupdate")
	public String selectBomList(@RequestParam("bom_id") String bom_id, Model model) {
		BomDTO bomDTO = bomService.selectOne(bom_id);
		model.addAttribute("bomDTO", bomDTO);
		return "bom/bomupdate";
	}
	// BOM 업데이트
	@RequestMapping(value = "/bomupdate/update", method = RequestMethod.POST)
	public String updateBom(BomDTO bomDTO) {
		// 업데이트 로직 처리
		bomService.updateBom(bomDTO);
		return "redirect:/bom";
	}
	// BOM 추가 페이지
	@RequestMapping("/bominsert")
	public String insertBom(Model model) {
		return "bom/bominsert";
	}
	// BOM 추가
	@RequestMapping(value = "/bominsert/insert", method = RequestMethod.POST)
	public String inserBomDo(BomDTO bomDTO) {
		System.out.println("컨트롤러 실행");
		bomService.insertBom(bomDTO);
		return "redirect:/bom";
	}
	// BOM 삭제
	@RequestMapping("/bomdelete")
	public String inserBomDo(@RequestParam("bom_id") String bom_id) {
		System.out.println("딜리트 컨트롤러 실행");
		bomService.deleteBom(bom_id);
		return "redirect:/bom";
	}


	@PostMapping("/bomp")
	@ResponseBody
	public List<BomDTO> getBomByProduct(@RequestParam("product_id") String productId) {
		List list = bomService.selectBompList(productId);
		System.out.println(list);
	    return list;
	}
	
	@RequestMapping("/organization")
	   public String organization(Model model) {
	      
	       return "bom/organization";
	   }
	
	@RequestMapping("/map")
	public String map(Model model) {
		
		return "bom/map";
	}
	// BOM 생성 (POST /createBom)
	@PostMapping("/createBom")
	public ResponseEntity<String> createBom(@RequestBody BomDTO bomDTO) {
	    try {
	        bomService.insertBom(bomDTO);
	        return ResponseEntity.ok("BOM created successfully");
	    } catch (Exception e) {
	        return ResponseEntity.status(500).body("Error creating BOM: " + e.getMessage());
	    }
	}

	// 자재 생성 (POST /createMaterial)
	@PostMapping("/createMaterial")
	public ResponseEntity<String> createMaterial(@RequestBody BomDTO materialDTO) {
	    try {
	        bomService.insertMaterial(materialDTO);
	        return ResponseEntity.ok("Material created successfully");
	    } catch (Exception e) {
	        return ResponseEntity.status(500).body("Error creating Material: " + e.getMessage());
	    }
	}

	// BOM 업데이트 (PUT /updateBom)
	@PutMapping("/updateBom/bom_id")
	public ResponseEntity<String> updateBom(@PathVariable String bom_id, @RequestBody BomDTO bomDTO) {
	    try {
	        bomDTO.setBom_id(bom_id); // ID 설정
	        bomService.updateBom(bomDTO); // 업데이트 로직 호출
	        return ResponseEntity.ok("BOM updated successfully");
	    } catch (Exception e) {
	        return ResponseEntity.status(500).body("Error updating BOM: " + e.getMessage());
	    }
	}
	
}
	

