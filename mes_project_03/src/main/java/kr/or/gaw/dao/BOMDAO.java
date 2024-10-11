package kr.or.gaw.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.BomDTO;

@Mapper
public interface BOMDAO {

	List<BomDTO> selectBomList(BomDTO dto);
	int getTotalDataCount(BomDTO dto);
}
