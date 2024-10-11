package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BOMDAO;
import kr.or.gaw.dto.BomDTO;

public class BomServiceImpl implements BomService {


	@Autowired
	@Qualifier("BOMDAOImpl")
	BOMDAO bomDAO;
	
	@Override
	public List<BomDTO> selectBom() {
		List<BomDTO> list = bomDAO.selectBom();
		return list;
	}
    @Override
    public List<BomDTO> selectBomByPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;  // 페이지 계산
        return bomDAO.selectBomByPage(offset, pageSize);
    }
	@Override
	 public int getBomCount() {
	  return bomDAO.getBomCount();  // DAO에서 실제 레코드 수 가져오기
	}
}
