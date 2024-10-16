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
	@Override
	public BomDTO selectOne(String bom_id) {
	    return bomDao.selectOne(bom_id);
	}

	@Override
	public int updateBom(BomDTO bomDTO) {
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
	// 자재 삽입 로직 추가
	public int insertMaterial(BomDTO materialDTO) {
	    // 자재 저장 로직
	    System.out.println("Material 저장 로직 실행");
	    return bomDao.insertMaterial(materialDTO); // 실제로 데이터베이스에 자재 저장하는 메서드 호출
	}

}
