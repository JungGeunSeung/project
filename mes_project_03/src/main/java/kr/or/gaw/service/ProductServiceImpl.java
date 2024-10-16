package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.BOMDAO;
import kr.or.gaw.dao.PlanDAO;
import kr.or.gaw.dao.ProductDAO;
import kr.or.gaw.dto.PlanDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	@Qualifier("productDAOImpl")
	ProductDAO productDao;

}

