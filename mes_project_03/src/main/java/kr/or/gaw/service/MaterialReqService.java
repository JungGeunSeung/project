package kr.or.gaw.service;

import java.util.List;
import kr.or.gaw.dto.RequestDTO;

public interface MaterialReqService {
    List<RequestDTO> getAllRequests(); // 모든 요청 조회
    RequestDTO getRequestById(String request_id); // 특정 요청 조회
    void addRequest(RequestDTO request); // 요청 추가
    void updateRequest(RequestDTO request); // 요청 업데이트
    void endRequest(String request_id); // 요청 종료

    // 페이징을 위한 메서드
    int getTotalRequestCount(RequestDTO dto); // 전체 요청 수 조회
    List<RequestDTO> getRequestsByPage(RequestDTO dto); // 페이지별 요청 조회
}
