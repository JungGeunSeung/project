package kr.or.gaw.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BOMDAO;
import kr.or.gaw.dto.BomDTO;
import kr.or.gaw.dto.ProductDTO;

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
	@Override
	public ProductDTO selectOne(String bom_id) {
	    return bomDao.selectOne(bom_id);
	}

	@Override
	public int updateBom(ProductDTO bomDTO) {
		int result = -1;
	    result = bomDao.updateBom(bomDTO);  
	    return result;  
	}
	
	@Override
	public int insertBom(BomDTO bomDTO) {
		System.out.println("서비스 실행");
		int result = -1;
	    result = bomDao.insertBom(bomDTO);  
	    return result;  
	}
	
	@Override
	public int deleteBom(String bom_id) {
		int result = -1;
	    result = bomDao.deleteBom(bom_id);  
	    return result;  
	}
	@Override
	public List selectBompList(String product_id){
		return bomDao.selectBompList(product_id);
	}
	

}
