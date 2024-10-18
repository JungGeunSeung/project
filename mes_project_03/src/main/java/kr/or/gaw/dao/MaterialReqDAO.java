package kr.or.gaw.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.or.gaw.dto.RequestDTO;

@Mapper
public interface MaterialReqDAO {
    List<RequestDTO> selectAll(); // 모든 요청 조회
    RequestDTO selectById(String request_id); // 특정 요청 조회
    void insertRequest(RequestDTO request); // 새로운 요청 삽입
    void updateRequest(RequestDTO request); // 요청 업데이트
    void endRequest(String request_id); // 요청을 종료 상태로 업데이트

    // 페이징을 위한 추가 메서드
    int selectTotalRequestCount(RequestDTO dto); // 전체 요청 수 조회
    List<RequestDTO> selectRequestsByPage(RequestDTO dto); // 페이지별 요청 조회
}
