package kr.or.gaw.service;


import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.gaw.dto.BomDTO;



@Service
public interface BomService {
	
	List selectBomList(BomDTO dto);
	int getTotalDataCount(BomDTO dto);
}
