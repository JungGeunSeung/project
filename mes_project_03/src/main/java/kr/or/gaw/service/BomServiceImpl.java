package kr.or.gaw.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BOMDAO;
import kr.or.gaw.dto.BomDTO;

@Service
public class BomServiceImpl implements BomService {

	@Autowired
	@Qualifier("BOMDAOImpl")
	BOMDAO bomDao;

	@Override
	public List selectBomList(BomDTO dto) {
		List list = null;
		list = bomDao.selectBomList(dto);
		return list;
	}
	@Override
	public int getTotalDataCount(BomDTO dto) {
		return bomDao.getTotalDataCount(dto);
	}

}
