package kr.or.gaw.dao;

import java.util.List;

import kr.or.gaw.dto.StockMoveDTO;

public interface StockDAO {

	List<StockMoveDTO> selectStock();
	
}