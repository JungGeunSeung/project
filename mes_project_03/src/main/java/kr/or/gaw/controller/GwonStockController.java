package kr.or.gaw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/createClient", method = RequestMethod.POST)
    @ResponseBody
    public String createClient(@RequestBody ClientDTO client) {
        int result = stockService.createClient(client);
        if (result > 0) {
            return "success";
        } else {
            return "failure";
        }
    }
	
	// 거래처 수정 메서드
	@RequestMapping(value = "/updateClient/{client_id}", method = RequestMethod.PUT)
	@ResponseBody
	public String updateClient(@RequestBody ClientDTO client, @PathVariable("client_id") String clientId) {
	    client.setClient_id(clientId); // 경로 변수로 받은 client_id 설정
	    int result = stockService.updateClient(client); // 수정 서비스 호출
	    if (result > 0) {
	        return "success";
	    } else {
	        return "failure";
	    }
	}
	
	// 거래처 삭제 메서드
	@RequestMapping(value = "/deleteClient/{client_id}", method = RequestMethod.DELETE)
	@ResponseBody
	public String deleteClient(@PathVariable("client_id") String clientId) {
	    int result = stockService.deleteClient(clientId); // 삭제 서비스 호출
	    System.out.println("컨트롤러 삭제 "+result);
	    return result > 0 ? "success" : "failure";
	}

}
