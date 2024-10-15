package kr.or.gaw.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.gaw.dto.BomDTO;

@Service
public interface BomService {
	
	List selectBompList(String product_id);
	List selectBomList(BomDTO dto);
	int getTotalDataCount(BomDTO dto);
	public BomDTO selectOne(String Bom_id);
	public int updateBom(BomDTO bomDTO);
	public int insertBom(BomDTO bomDTO);
	public int deleteBom(String Bom_id);
	
}
