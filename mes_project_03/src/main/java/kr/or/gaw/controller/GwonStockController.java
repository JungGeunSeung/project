package kr.or.gaw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.gaw.dto.ClientDTO;
import kr.or.gaw.dto.EmpDTO;
import kr.or.gaw.dto.StockMoveDTO;
import kr.or.gaw.service.StockService;

@Controller
public class GwonStockController {
	
	@Autowired
	StockService stockService;
	
	@RequestMapping("/selectStock")
	@ResponseBody
	public List<StockMoveDTO> selectStock(){
		List<StockMoveDTO> list = stockService.selectStock();
		System.out.println("데이터베스 연결 시작 : "+ list);
		return list;
	}
	
	@RequestMapping("/stock")
	public String stock(HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	      if (loggedInUser == null) {
	           return "redirect:/login";       }
		return "stock/stockmove";
	}
	
	
	@RequestMapping("selectClient")
	@ResponseBody
	public List<ClientDTO> selectClient(){
		List<ClientDTO> list = stockService.selectClient();
		System.out.println("고객 데이터베스 연결 시작 : "+ list);
		return list;
	}
	
	@RequestMapping("/client_m")
	public String client_m(HttpSession session) {
		EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
	      if (loggedInUser == null) {
	           return "redirect:/login";       }
		return "stock/client_m";
	}
	
//	거래처를 추가하는 매서드
	@RequestMapping("/createClient")
    @ResponseBody
    public String createClient(@RequestBody ClientDTO client) {
        int result = stockService.createClient(client);
        if (result > 0) {
            return "success";
        } else {
            return "failure";
        }
    }
}
