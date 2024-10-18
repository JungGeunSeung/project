package kr.or.gaw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.RequestDTO;
import kr.or.gaw.service.MaterialReqService;

@Controller
@RequestMapping("/materialReq")
public class SoMaterialReqController {

    @Autowired
    private MaterialReqService materialReqService;

    // 요청 목록 조회 + 페이징
    @GetMapping
    public String selectMaterialReqList(RequestDTO dto, Model model, 
                                        @RequestParam(value = "page", defaultValue = "1") Integer page,
                                        HttpSession session,
                                        @RequestParam(value = "countperpage", defaultValue = "10") Integer countperpage) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
      
        // 페이지 정보 설정
        dto.setPage(page);
        dto.setCountperpage(countperpage);

        // 데이터 리스트 조회
        List<RequestDTO> list = materialReqService.getRequestsByPage(dto);

        // 전체 데이터 수 조회
        int totalDataCount = materialReqService.getTotalRequestCount(dto);

        // 총 페이지 계산
        int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);

        // 동적 페이지 범위 계산
        int startPage = Math.max(1, page - 3);
        int endPage = Math.min(totalPage, page + 3);

        // 모델에 필요한 데이터 추가
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("requests", list);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("countperpage", countperpage);

        return "materialreq/materialreq"; // 반환할 JSP 페이지 이름
    }

    // 새로운 요청 추가 폼
    @GetMapping("/add")
    public String addRequestForm(Model model, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        model.addAttribute("request", new RequestDTO());
        return "materialreq/addRequest";
    }

    // 새로운 요청 추가 처리
    @PostMapping("/add")
    public String addRequest(@ModelAttribute("request") RequestDTO request, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        materialReqService.addRequest(request);
        return "redirect:/materialreq";
    }

    // 요청 수정 폼
    @GetMapping("/update/id")
    public String updateRequestForm(@PathVariable("id") String request_id, Model model, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        RequestDTO request = materialReqService.getRequestById(request_id);
        model.addAttribute("request", request);
        return "materialreq/materialrequpdate";
    }

    // 요청 수정 처리
    @PostMapping("/update")
    public String updateRequest(@ModelAttribute("request") RequestDTO request, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        materialReqService.updateRequest(request);
        return "redirect:/materialreq";
    }

    // 요청 종료 처리
    @GetMapping("/end/id")
    public String endRequest(@PathVariable("id") String request_id, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        materialReqService.endRequest(request_id);
        return "redirect:/materialreq";
    }
}
