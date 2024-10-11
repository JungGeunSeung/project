package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.gaw.dto.BomDTO;
@Mapper
public interface BOMDAO {

	public List<BomDTO> selectBom();
	public List<BomDTO> selectBomByPage(int page, int pageSize);
	int getBomCount();
	
}
