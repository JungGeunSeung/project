package kr.or.gaw.service;

import java.util.List;

import kr.or.gaw.dto.StockMoveDTO;

public interface StockService {

	List<StockMoveDTO> selectStock();
}
