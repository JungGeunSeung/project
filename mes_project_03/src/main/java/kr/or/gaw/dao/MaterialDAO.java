package kr.or.gaw.dao;

import java.util.List;
import kr.or.gaw.dto.MaterialDTO;

public interface MaterialDAO {

    // 페이징 자재 목록 조회
    List<MaterialDTO> selectMaterialList(MaterialDTO dto);

    // 모든 자재 목록 조회
    List<MaterialDTO> selectAll();

    // 특정 자재 조회
    MaterialDTO selectById(String materialId);

    // 새로운 자재 추가
    void insert(MaterialDTO materialDTO);

    // 기존 자재 업데이트
    void update(MaterialDTO materialDTO);

    // 자식 레코드 삭제
    void deleteChildRecords(String materialId);

    // 특정 자재 삭제 (부모 테이블의 자재 삭제)
    void delete(String materialId);

    // 페이징을 위한 총 데이터 수 계산
    int getTotalDataCount(MaterialDTO dto);
}