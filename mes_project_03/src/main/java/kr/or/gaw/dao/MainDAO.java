package kr.or.gaw.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	
	public List mainpageProductPerformance() {
		return sqlsession.selectList("kr.or.gaw.dao.MainDAO.mainpageProductPerformance");
	}
	
	public List mainpagePlan() {
		return sqlsession.selectList("kr.or.gaw.dao.MainDAO.mainpagePlan");
	}
	
}
