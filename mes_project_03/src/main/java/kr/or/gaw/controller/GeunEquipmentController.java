package kr.or.gaw.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.DowntimeDTO;
import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.EquipmentDTO;
import kr.or.gaw.dto.MaintenanceDTO;
import kr.or.gaw.dto.PaginationDTO;
import kr.or.gaw.service.EmpService;
import kr.or.gaw.service.EquipmentService;

@Controller
public class GeunEquipmentController {
	
	@Autowired
	EquipmentService EquipService;
	
	@Autowired
	EmpService empService;

	public static Timestamp combineDateTime(String date, String hour, String minute) throws ParseException {
	    String dateTimeStr = date + " " + hour + ":" + minute + ":00";
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    java.util.Date parsedDate = dateFormat.parse(dateTimeStr);  // util.Date 사용됨
	    return new Timestamp(parsedDate.getTime());  // 명시적으로 Timestamp 반환
	}

	
	// 설비관리 페이지 입장
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
	
	// 설비 삭제하기
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
	
	
	///////////////////////////////// 유지보수 /////////////////////////////////////////////
	
	
	// 유지보수 페이지 입장
	@RequestMapping("/maintenance")
	public String maintenanceIn(HttpSession session, Model model, MaintenanceDTO dto) {
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
		
		// 유지보수 리스트 가져오기
		List list = EquipService.listMaintenance(dto);
		List list2 = EquipService.listEquipIDandName();
		List listType = EquipService.searchTypeEquip();
		List listEmp = empService.listEmp();
		
		int totalequip = EquipService.totalMaintenanceWithSearch(dto);
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
		model.addAttribute("list", list); // 유지보수 데이터
		model.addAttribute("equipList", list2); // 설비아이디,설비이름 데이터
		model.addAttribute("listType", listType); // 설비 유형
		model.addAttribute("listEmp", listEmp); // 점검자를 넣기위한 Emp 리스트
		return "equipment/maintenance";
	}
	
	// 유지보수 추가하기
	@PostMapping("/insertMaintenance.do")
	@ResponseBody
	public Map<String, Object> maintenanceInsert(HttpSession session, MaintenanceDTO dto, 
	        @RequestParam("main_date") String main_date) {

	    Map<String, Object> resultMap = new HashMap();

	    EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	    if (loggedInUser == null) {
	        resultMap.put("success", false);
	        resultMap.put("message", "로그인이 필요합니다.");
	        return resultMap;
	    }

	    // 날짜 변환
	    try {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date mainDate = new Date(sdf.parse(main_date).getTime());
	        dto.setMain_date(mainDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        resultMap.put("success", false);
	        resultMap.put("message", "날짜 변환에 실패했습니다.");
	        return resultMap;
	    }

	    // main ID 설정
	    int maxnum = EquipService.maxMaintenanceID();
	    String mainId = String.format("MAIN_%03d", maxnum + 1);
	    dto.setMain_id(mainId);

	    // DB에 유지보수 추가
	    int result = EquipService.insertMaintenance(dto);
	    if (result > 0) {
	        resultMap.put("success", true);
	    } else {
	        resultMap.put("success", false);
	        resultMap.put("message", "유지보수 저장에 실패했습니다.");
	    }

	    return resultMap;
	}
	
	// 유지보수 수정하기
	@PostMapping("/updateMaintenance.do")
	@ResponseBody
	public Map<String, Object> maintenanceUpdate(HttpSession session, MaintenanceDTO dto, 
	                                             @RequestParam("main_date") String main_date) {
	    Map<String, Object> response = new HashMap();
	    EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	    
	    if (loggedInUser == null) {
	        response.put("success", false);
	        response.put("message", "로그인이 필요합니다.");
	        return response;
	    }

	    // String을 java.sql.Date로 변환하여 DTO에 설정
	    try {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date mainDate = new Date(sdf.parse(main_date).getTime());
	        dto.setMain_date(mainDate);
	    } catch (ParseException e) {
	        e.printStackTrace();
	        response.put("success", false);
	        response.put("message", "날짜 형식이 잘못되었습니다.");
	        return response;
	    }
	    System.out.println(dto.toString());
	    // DB에 장비 수정
	    int result = EquipService.updateMaintenance(dto);

	    if (result > 0) {
	        response.put("success", true);
	        response.put("message", "유지보수가 성공적으로 수정되었습니다.");
	    } else {
	        response.put("success", false);
	        response.put("message", "유지보수 수정에 실패했습니다.");
	    }

	    return response;
	}

	
	// 유지보수 삭제하기
	@PostMapping("/deleteMaintenance.do")
	public ResponseEntity<String> deleteMaintenance(HttpSession session, 
			@RequestParam("main_id") String mainId) {
		// 로그인 유저 확인
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return new ResponseEntity("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
		}
		
		try {
			// DB에서 해당 mainId 삭제 처리
			int result = EquipService.deleteMaintenance(mainId);
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
	
	
	///////////////////////////////// 비가동 /////////////////////////////////////////////
	
	
	// 비가동 페이지 입장
	@RequestMapping("/downtime")
	public String downtimeIn(HttpSession session, Model model, DowntimeDTO dto) {
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
		
		// 유지보수 리스트 가져오기
		List list = EquipService.listDowntime(dto);
		List list2 = EquipService.listEquipIDandName();
		List listType = EquipService.searchTypeEquip();
		List listEmp = empService.listEmp();
		
		int totalequip = EquipService.totalDowntimeWithSearch(dto);
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
		model.addAttribute("list", list); // 비가동 데이터
		model.addAttribute("equipList", list2); // 설비아이디,설비이름 데이터
		model.addAttribute("listType", listType); // 설비 유형
		model.addAttribute("listEmp", listEmp); // 점검자를 넣기위한 Emp 리스트
		return "equipment/downtime";
	}
	
	// 비가동 추가하기
	@PostMapping("/insertdowntime.do")
	@ResponseBody
	public Map<String, Object> downtimeInsert(HttpSession session, DowntimeDTO dto) {
		
		Map<String, Object> resultMap = new HashMap();
		
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			resultMap.put("success", false);
			resultMap.put("message", "로그인이 필요합니다.");
			return resultMap;
		}
		
		
		// main ID 설정
		String downtimeId = "DT_" + UUID.randomUUID().toString().substring(0, 8);
		dto.setDowntime_id(downtimeId);
		
		try {
		    dto.setStart_time(combineDateTime(dto.getStart_date(), dto.getStartHour(), dto.getStartMin()));
		    dto.setEnd_time(combineDateTime(dto.getEnd_date(), dto.getEndHour(), dto.getEndMin()));
		} catch (ParseException e) {
		    e.printStackTrace();
		    resultMap.put("success", false);
		    resultMap.put("message", "날짜 변환에 실패했습니다.");
		    return resultMap;
		} catch (Exception e) {
		    e.printStackTrace();
		    resultMap.put("success", false);
		    resultMap.put("message", "비가동 등록 중 오류가 발생했습니다.");
		    return resultMap;
		}
		
		
		// DB에 비가동이력 추가
		int result = EquipService.insertDowntime(dto);
		if (result > 0) {
			resultMap.put("success", true);
		} else {
			resultMap.put("success", false);
			resultMap.put("message", "비가동이력 저장에 실패했습니다.");
		}
		
		return resultMap;
	}
	
	// 비가동 수정하기
	@PostMapping("/updatedowntime.do")
	@ResponseBody
	public Map<String, Object> downtimeUpdate(HttpSession session, DowntimeDTO dto) {
		Map<String, Object> response = new HashMap();
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		
		if (loggedInUser == null) {
			response.put("success", false);
			response.put("message", "로그인이 필요합니다.");
			return response;
		}
		
		try {
		    dto.setStart_time(combineDateTime(dto.getStart_date(), dto.getStartHour(), dto.getStartMin()));
		    dto.setEnd_time(combineDateTime(dto.getEnd_date(), dto.getEndHour(), dto.getEndMin()));
		} catch (ParseException e) {
		    e.printStackTrace();
		    response.put("success", false);
		    response.put("message", "날짜 변환에 실패했습니다.");
		    return response;
		} catch (Exception e) {
		    e.printStackTrace();
		    response.put("success", false);
		    response.put("message", "비가동 등록 중 오류가 발생했습니다.");
		    return response;
		}
		
		
		// DB에 장비 수정
		int result = EquipService.updateDowntime(dto);
		
		if (result > 0) {
			response.put("success", true);
			response.put("message", "비가동이력이 성공적으로 수정되었습니다.");
		} else {
			response.put("success", false);
			response.put("message", "비가동이력이 수정에 실패했습니다.");
		}
		
		return response;
	}
	
	
	// 비가동 삭제하기
	@PostMapping("/deletedowntime.do")
	public ResponseEntity<String> deletedowntime(HttpSession session, 
			@RequestParam("downtime_id") String downtimeId) {
		// 로그인 유저 확인
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return new ResponseEntity("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
		}
		
		try {
			// DB에서 해당 mainId 삭제 처리
			int result = EquipService.deleteDowntime(downtimeId);
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
