package kr.or.gaw.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import kr.or.gaw.dto.CostDTO;
import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.service.CostService;

@Controller
@RequestMapping("/cost")
public class SoCostController {

    @Autowired
    private CostService costService;

    // Read (원가 목록 조회)
    @GetMapping
    public String selectCostList(CostDTO dto, Model model, 
                                 @RequestParam(value = "page", defaultValue = "1") Integer page, 
                                 HttpSession session,
                                 @RequestParam(value = "countperpage", defaultValue = "10") Integer countperpage) {
        // 로그인된 사용자가 없으면 로그인 페이지로 리다이렉트
        EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        // offset 계산
        int offset = (page - 1) * countperpage;
        dto.setPage(page);
        dto.setCountperpage(countperpage);

        // 페이징 처리된 원가 목록 조회
        List<CostDTO> costList = costService.selectCostList(dto, offset, countperpage);

        // 총 데이터 수를 구하여 페이지 계산
        int totalDataCount = costService.getTotalDataCount(dto);
        int totalPage = (int) Math.ceil((double) totalDataCount / countperpage);

        // 동적 페이지 범위 계산
        int startPage = Math.max(1, page - 3);
        int endPage = Math.min(totalPage, page + 3);

        System.out.println(costList);
        // 모델에 데이터 추가
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("materialList", costList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("countperpage", countperpage);

        return "cost/cost";  // cost 페이지로 리턴
    }

    // Create (원가 생성)
    @PostMapping("/add")
    public String insertCost(CostDTO cost) {
        costService.insertCost(cost);
        return "redirect:/cost";
    }

    // Update (원가 수정)
    @PostMapping("/update")
    public String updateCost(CostDTO cost) {
        costService.updateCost(cost);
        return "redirect:/cost";
    }

    // Complete (원가 완료 처리)
    @PostMapping("/complete")
    public String completeCost(@RequestParam("cost_id") String cost_id) {
        costService.completeCost(cost_id);  // 완료 상태로 변경하는 서비스 호출
        return "redirect:/cost";
    }
}
