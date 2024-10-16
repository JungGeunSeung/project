package kr.or.gaw.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.dto.ProductDTO;

@Service
public interface BomService {
	
	List selectBompList(String product_id);
	List selectBomList(BomDTO dto);
	int getTotalDataCount(BomDTO dto);
	public ProductDTO selectOne(String Bom_id);
	public int updateBom(ProductDTO bomDTO);
	public int insertBom(BomDTO bomDTO);
	public int deleteBom(String Bom_id);
	
}
