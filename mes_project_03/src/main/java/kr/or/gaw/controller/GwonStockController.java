package kr.or.gaw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String stock() {
		return "stock/stockmove";
	}
	
	
}
