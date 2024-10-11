package kr.or.gaw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.gaw.dto.BomDTO;

@Service
public interface BomService {

	public List<BomDTO> selectBom();
	public List<BomDTO>selectBomByPage(int page, int pageSize);
	int getBomCount();
}
