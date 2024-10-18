package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.gaw.dto.InventoryDTO;
import kr.or.gaw.service.InventoryService;

@Controller
@RequestMapping("/inventory")  // inventory 경로만 사용
public class InventoryController {

    @Autowired
    private InventoryService inventoryService;

    @GetMapping("/list")
    public String list(Model model) {
        List<InventoryDTO> inventoryList = inventoryService.selectAll();
        model.addAttribute("inventoryList", inventoryList);
        return "inventory/inventory";  // JSP 파일 경로를 inventory로 변경
    }

    @GetMapping("/view")
    public String view(@RequestParam("inventoryId") String inventoryId, Model model) {
        InventoryDTO inventory = inventoryService.selectById(inventoryId);
        model.addAttribute("inventory", inventory);
        return "inventory/view";  // JSP 파일 경로
    }

    @PostMapping("/insert")
    public String insert(InventoryDTO inventoryDTO) {
        inventoryService.insert(inventoryDTO);
        return "redirect:/inventory";  // 삽입 후 리스트로 이동
    }

    @PostMapping("/update")
    public String update(InventoryDTO inventoryDTO) {
        inventoryService.update(inventoryDTO);
        return "redirect:/inventory";  // 수정 후 리스트로 이동
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("inventoryId") String inventoryId) {
        inventoryService.delete(inventoryId);
        return "redirect:/inventory";  // 삭제 후 리스트로 이동
    }
}
