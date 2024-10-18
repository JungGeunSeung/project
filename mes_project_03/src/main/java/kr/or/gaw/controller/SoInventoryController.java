package kr.or.gaw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.InventoryDTO;
import kr.or.gaw.service.InventoryService;

@Controller

public class SoInventoryController {

    @Autowired
    private InventoryService inventoryService;

    @RequestMapping("/inventory")
    public String selectInventoryList(InventoryDTO dto, Model model, HttpSession session ,
                                      @RequestParam(value = "page", defaultValue = "1") Integer page,
                                      @RequestParam(value = "countperpage", defaultValue = "10") Integer countperpage) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        // offset 계산
        int offset = (page - 1) * countperpage;
        dto.setOffset(offset);
        dto.setPage(page);
        dto.setCountperpage(countperpage);

        // 페이징 처리된 인벤토리 목록 조회
        List<InventoryDTO> inventoryList = inventoryService.selectInventoryList(dto);

        // 총 데이터 수를 구하여 페이지 계산
        int totalDataCount = inventoryService.getTotalDataCount(dto);
        int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);

        // 동적 페이지 범위 계산
        int startPage = Math.max(1, page - 3);
        int endPage = Math.min(totalPage, page + 3);

        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("inventoryList", inventoryList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("countperpage", countperpage);

        return "inventory/inventory";  // 인벤토리 JSP 페이지로 반환
    }

    @GetMapping("/view")
    public String view(@RequestParam("inventoryId") String inventoryId, Model model, HttpSession session ) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        InventoryDTO inventory = inventoryService.selectById(inventoryId);
        model.addAttribute("inventory", inventory);
        return "inventory/view";  // view.jsp로 반환
    }

    @PostMapping("/insert")
    public String insert(@ModelAttribute HttpSession session , InventoryDTO inventoryDTO) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        inventoryService.insert(inventoryDTO);
        return "redirect:/inventory";  // 삽입 후 리스트 페이지로 리디렉션
    }

    @PostMapping("/update")
    public String update(@ModelAttribute HttpSession session , InventoryDTO inventoryDTO) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
        	return "redirect:/login";       }
        inventoryService.update(inventoryDTO);
        return "redirect:/inventory";  // 수정 후 리스트 페이지로 리디렉션
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("inventoryId") String inventoryId, HttpSession session ) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        inventoryService.delete(inventoryId);
        return "redirect:/inventory";  // 삭제 후 리스트 페이지로 리디렉션
    }
}
