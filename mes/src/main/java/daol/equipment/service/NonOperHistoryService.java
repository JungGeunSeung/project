package daol.equipment.service;

import java.util.List;

import daol.equipment.dao.NonOperHistoryDAO;
import daol.equipment.dto.NonOperHistoryDTO;

public class NonOperHistoryService {
    private NonOperHistoryDAO nonOperHistoryDAO;

    public NonOperHistoryService() {
        this.nonOperHistoryDAO = new NonOperHistoryDAO();
    }

    // 페이징을 적용한 비운전 이력 조회 메서드
    public List<NonOperHistoryDTO> getNonOperHistoryByPage(int pageSize, int pageNumber, String sortField, String sortOrder) {
        return nonOperHistoryDAO.getNonOperHistoryByPage(pageSize, pageNumber, sortField, sortOrder);
    }

    // 기본 ResultID 조회 메서드
    public String getDefaultResultID() {
        return nonOperHistoryDAO.getDefaultResultID();
    }

    // 비운전 이력 추가 메서드
    public void addNonOperHistory(NonOperHistoryDTO nonOperHistory) {
        nonOperHistoryDAO.addNonOperHistory(nonOperHistory);
    }

    // 비운전 이력 수정 메서드
    public void updateNonOperHistory(NonOperHistoryDTO nonOperHistory) {
        nonOperHistoryDAO.updateNonOperHistory(nonOperHistory);
    }

    // 비운전 이력 삭제 메서드
    public void deleteNonOperHistory(String resultID, String equiID) {
        nonOperHistoryDAO.deleteNonOperHistory(resultID, equiID);
    }
}
