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
import kr.or.gaw.dto.MaterialDTO;
import kr.or.gaw.service.MaterialService;

@Controller
@RequestMapping("/material")  // 컨트롤러의 기본 경로를 /material로 설정
public class SoMaterialController {

    @Autowired
    private MaterialService materialService;

    // 페이징 처리된 자재 목록 조회 메서드
    @GetMapping
    public String selectBomList(MaterialDTO dto, Model model, 
                                @RequestParam(value = "page", defaultValue = "1") Integer page, HttpSession session,
                                @RequestParam(value = "countperpage", defaultValue = "10") Integer countperpage) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        // offset 계산
        int offset = (page - 1) * countperpage;
        dto.setOffset(offset);
        dto.setPage(page);
        dto.setCountperpage(countperpage);

        // 페이징 처리된 자재 목록 조회
        List<MaterialDTO> materialList = materialService.selectMaterialList(dto);

        // 총 데이터 수를 구하여 페이지 계산
        int totalDataCount = materialService.getTotalDataCount(dto);
        int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);

        // 동적 페이지 범위 계산
        int startPage = Math.max(1, page - 3);
        int endPage = Math.min(totalPage, page + 3);

        // 모델에 데이터 추가
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("materialList", materialList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("countperpage", countperpage);

        return "material/material";  // material.jsp로 반환
    }

    // 모든 자재 리스트를 보여주는 메서드
    @GetMapping("/list")
    public String materialList(Model model, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        List<MaterialDTO> materialList = materialService.selectAll();
        model.addAttribute("materialList", materialList);
        return "material/material";  // material.jsp로 반환
    }

    // 특정 자재를 보기 위한 메서드
    @GetMapping("/view")
    public String view(@RequestParam("material_id") String material_id, Model model, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        MaterialDTO material = materialService.selectById(material_id);
        model.addAttribute("material", material);
        return "material/view";  // view.jsp로 반환
    }

    // 새로운 자재를 추가하는 메서드
    @PostMapping("/insert")
    public String insert(@ModelAttribute MaterialDTO materialDTO, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        materialService.insert(materialDTO);
        return "redirect:/material";  // 삽입 후 리스트 페이지로 리디렉션
    }

    // 자재를 수정하는 메서드
    @PostMapping("/update")
    public String update(@ModelAttribute MaterialDTO materialDTO, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        
        materialService.update(materialDTO);
        return "redirect:/material";  // 수정 후 리스트 페이지로 리디렉션
    }

    // 특정 자재를 삭제하는 메서드
    @GetMapping("/delete")
    public String delete(@RequestParam("material_id") String material_id, HttpSession session) {
    	EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
             return "redirect:/login";       }
        materialService.delete(material_id);
        return "redirect:/material";  // 삭제 후 리스트 페이지로 리디렉션
    }
}
