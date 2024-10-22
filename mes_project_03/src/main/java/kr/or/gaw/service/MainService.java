package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.MainDAO;

@Service
public class MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	public List mainpageProductPerformance() {
		return mainDAO.mainpageProductPerformance();
	}
	
	public List mainpagePlan() {
		return mainDAO.mainpagePlan();
	}
}
