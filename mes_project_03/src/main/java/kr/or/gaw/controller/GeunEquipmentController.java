package kr.or.gaw.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.EquipmentDTO;
import kr.or.gaw.dto.PaginationDTO;
import kr.or.gaw.service.EquipmentService;

@Controller
public class GeunEquipmentController {
	
	@Autowired
	EquipmentService EquipService;

	@RequestMapping("/equip")
	public String equipIn(HttpSession session, Model model, EquipmentDTO dto) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
	        return "redirect:/login";
	    }
		
		// 기본값 설정
		if (dto.getPage() == null) dto.setPage(1);
		if (dto.getCountPerPage() == null) dto.setCountPerPage(20);
		if (dto.getSearchType() == null) dto.setSearchType("");
		if (dto.getSearchKeyword() == null) dto.setSearchKeyword("");
	    
		int page = Math.max(1, dto.getPage());
		int countPerPage = Math.max(1, dto.getCountPerPage());
	    String searchType = dto.getSearchType();
	    

	    // 페이지 범위 계산
	    int startRow = (dto.getPage() - 1) * dto.getCountPerPage() + 1;
	    int endRow = dto.getPage() * dto.getCountPerPage();
	    dto.setStartRow(startRow);
	    dto.setEndRow(endRow);
	    
	    // 설비 리스트 가져오기
		List list = EquipService.listEquip(dto);
		List listType = EquipService.searchTypeEquip();
		List listLocation = EquipService.searchLocationEquip();
		List listStatus = EquipService.searchStatusEquip();
		
		int totalequip = EquipService.totalEquipmentWithSearch(dto);
		int totalPages = (int) Math.ceil((double) totalequip / countPerPage);

	    // 페이지네이션 정보 계산
	    int displayPageCount = 5;
	    int startPage = Math.max(1, page - displayPageCount / 2);
	    int endPage = Math.min(totalPages, startPage + displayPageCount - 1);

	    boolean hasPrev = page > 1;
	    boolean hasNext = page < totalPages;
	    int prevPage = hasPrev ? page - 1 : 1;
	    int nextPage = hasNext ? page + 1 : totalPages;

	    
	    // 페이지네이션 정보를 모델에 추가
	    PaginationDTO pagination = new PaginationDTO(
	    	    page, totalPages, startPage, endPage, hasPrev, hasNext, prevPage, nextPage, countPerPage
	    	);

	    // 모델에 데이터 추가
	    model.addAttribute("pagination", pagination); // 페이지네이션 관련 데이터
	    model.addAttribute("list", list); // 설비 데이터
	    model.addAttribute("listType", listType); // 설비 타입
	    model.addAttribute("listLocation", listLocation); // 설비 타입
	    model.addAttribute("listStatus", listStatus); // 설비 타입
		
		return "equipment/equip";
	}
	
	// 설비 추가하기
	@PostMapping("/insertEquip.do")
	public String equipInsert(HttpSession session, Model model, EquipmentDTO dto, 
	                          @RequestParam("purchase") String purchase) {
	    EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	    if (loggedInUser == null) {
	        return "redirect:/login";
	    }

	    // String을 java.sql.Date로 변환하여 DTO에 설정
	    try {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date purchaseDate = new Date(sdf.parse(purchase).getTime());
	        dto.setPurchase(purchaseDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        return "error";  // 날짜 변환에 실패하면 에러 페이지로 이동
	    }

	    // Equip ID 설정
	    int maxnum = EquipService.maxEquipID();
	    System.out.println("maxnum : " + maxnum);
	    if (maxnum < 10) {
	        dto.setEquip_id("E" + "00" + (maxnum + 1));
	    } else if (maxnum >= 10 && maxnum < 100) {
	        dto.setEquip_id("E" + "0" + (maxnum + 1));
	    } else {
	        dto.setEquip_id("E" + (maxnum + 1));
	    }

	    // DB에 장비 추가
	    int result = EquipService.insertEquip(dto);
	    return "redirect:equip";
	}
	
	// 설비 수정하기
	@PostMapping("/updateEquip.do")
	public String equipUpdate(HttpSession session, Model model, EquipmentDTO dto, 
			@RequestParam("purchase") String purchase) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return "redirect:/login";
		}
		
		// String을 java.sql.Date로 변환하여 DTO에 설정
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date purchaseDate = new Date(sdf.parse(purchase).getTime());
			dto.setPurchase(purchaseDate);
		} catch (ParseException e) {
			e.printStackTrace();
			return "error";  // 날짜 변환에 실패하면 에러 페이지로 이동
		}
		
		
		// DB에 장비 수정
		int result = EquipService.updateEquip(dto);
		return "redirect:equip";
	}
	
	@PostMapping("/deleteEquip.do")
    public ResponseEntity<String> deleteEquip(HttpSession session, 
                                              @RequestParam("equip_id") String equipId) {
        // 로그인 유저 확인
        EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return new ResponseEntity("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        }

        try {
            // DB에서 해당 equip_id 삭제 처리
            int result = EquipService.deleteEquip(equipId);
            if (result > 0) {
                // 성공적으로 삭제된 경우 응답
                return new ResponseEntity("삭제 성공", HttpStatus.OK);
            } else {
                // 삭제 실패 시 응답
                return new ResponseEntity("삭제 실패", HttpStatus.BAD_REQUEST);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity("서버 오류 발생", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
}
