package kr.or.gaw.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.gaw.dao.MaterialDAO;
import kr.or.gaw.dto.MaterialDTO;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    private MaterialDAO materialDAO;

    @Override
    public List<MaterialDTO> selectAll() {
        return materialDAO.selectAll();
    }

    @Override
    public MaterialDTO selectById(String materialId) {
        return materialDAO.selectById(materialId);
    }

    @Override
    public void insert(MaterialDTO materialDTO) {
        materialDAO.insert(materialDTO);
    }

    @Override
    public void update(MaterialDTO materialDTO) {
        materialDAO.update(materialDTO);
    }

    @Override
    public void delete(String materialId) {
        materialDAO.delete(materialId);
    }

    @Override
    public List<MaterialDTO> selectMaterialList(MaterialDTO dto) {
        return materialDAO.selectMaterialList(dto);
    }

    @Override
    public int getTotalDataCount(MaterialDTO dto) {
        return materialDAO.getTotalDataCount(dto);
    }
}
