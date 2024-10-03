package daeho.production.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import daeho.production.dao.ProductionPlanDAO;
import daeho.production.dto.ProductionPlanDTO;

public class ProductionPlanService {
    private ProductionPlanDAO dao = new ProductionPlanDAO();


	public Map getservicePage(String countPerPage, String page) {

		int count = Integer.parseInt(countPerPage);
		int pageNo = Integer.parseInt(page);

		int start = ((pageNo - 1) * count) + 1;
		int end = pageNo * count;
//		int end = start + count -1;

		ProductionPlanDAO pdpDAO = new ProductionPlanDAO();
		List list = pdpDAO.selectPlan(start, end);

		int totalCount = pdpDAO.totalCount(); // 리스트와 전체 페이지를 알게 된다.

		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}
	
	public void addPlan(ProductionPlanDTO plan) {
        try {
			dao.insertPlan(plan);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // 새로운 계획을 DB에 삽입
    }

    public void updatePlan(ProductionPlanDTO plan) {
        try {
			dao.updatePlan(plan);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // 기존 계획을 DB에서 수정
    }

    public ProductionPlanDTO getPlanById(String planid) {
        try {
			return dao.selectPlanById(planid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  // 특정 planid에 해당하는 계획을 조회
		return null;
    }


}
