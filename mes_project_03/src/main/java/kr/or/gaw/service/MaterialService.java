package kr.or.gaw.service;

import java.util.List;
import kr.or.gaw.dto.MaterialDTO;

public interface MaterialService {

    List<MaterialDTO> selectAll();  // 모든 자재 조회

    MaterialDTO selectById(String materialId);  // 특정 자재 조회

    void insert(MaterialDTO materialDTO);  // 새로운 자재 추가

    void update(MaterialDTO materialDTO);  // 자재 업데이트

    void delete(String materialId);  // 자재 삭제

    List<MaterialDTO> selectMaterialList(MaterialDTO dto);  // 페이징 자재 목록 조회

    int getTotalDataCount(MaterialDTO dto);  // 페이징을 위한 총 데이터 수 계산
}
