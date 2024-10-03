package daeho.production.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import daeho.production.dao.ProductionReslutDAO;
import daeho.production.dto.ProductionResultDTO;



//비즈니스 로직을 처리하는 서비스 클래스
public class ProductionResultService {
 private ProductionReslutDAO productionResultDAO;

 // 서비스의 생성자에서 DAO 객체를 초기화
 public ProductionResultService(Connection conn) {
     this.productionResultDAO = new ProductionReslutDAO(conn);
 }

 // 모든 생산 결과를 조회하는 서비스 메서드
 public List<ProductionResultDTO> getAllResults() throws SQLException {
     return productionResultDAO.getAllResults();
 }

// 단일 생산 결과를 조회하는 서비스 메서드
 public ProductionResultDTO getResultById(String resultID) throws SQLException {
     return productionResultDAO.getResultById(resultID);
 }

 // 새로운 생산 결과를 삽입하는 서비스 메서드
 public void insertResult(ProductionResultDTO result) throws SQLException {
     productionResultDAO.insertResult(result);
 }

 // 기존 생산 결과를 업데이트하는 서비스 메서드
 public void updateResult(ProductionResultDTO result) throws SQLException {
     productionResultDAO.updateResult(result);
 }

 // 특정 생산 결과를 삭제하는 서비스 메서드
 public void deleteResult(String resultID) throws SQLException {
     productionResultDAO.deleteResult(resultID);
 }
}
