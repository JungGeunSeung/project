package kr.or.gaw.dao;

import java.util.List;

import kr.or.gaw.dto.StandardDTO;

public interface StandardDAO {
	List<StandardDTO> selectStandard();
}
