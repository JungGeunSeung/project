package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.StandardDAO;
import kr.or.gaw.dto.StandardDTO;

@Service
public class StandardServiceImpl implements StandardService {
	
	@Autowired
	StandardDAO standardDAO;
	
	@Override
	public List<StandardDTO> selectStandard(){
		List<StandardDTO> list = standardDAO.selectStandard();
		return list;
	}
}
