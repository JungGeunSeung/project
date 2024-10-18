package kr.or.gaw.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.gaw.dao.InventoryDAO;
import kr.or.gaw.dto.InventoryDTO;

@Service
public class InventoryServiceImpl implements InventoryService {

    @Autowired
    private InventoryDAO inventoryDAO;

    @Override
    public List<InventoryDTO> selectAll() {
        return inventoryDAO.selectAll();
    }

    @Override
    public InventoryDTO selectById(String inventoryId) {
        return inventoryDAO.selectById(inventoryId);
    }

    @Override
    public void insert(InventoryDTO inventoryDTO) {
        inventoryDAO.insert(inventoryDTO);
    }

    @Override
    public void update(InventoryDTO inventoryDTO) {
        inventoryDAO.update(inventoryDTO);
    }

    @Override
    public void delete(String inventoryId) {
        inventoryDAO.delete(inventoryId);
    }

    @Override
    public List<InventoryDTO> selectInventoryList(InventoryDTO dto) {
        return inventoryDAO.selectInventoryList(dto);
    }

    @Override
    public int getTotalDataCount(InventoryDTO dto) {
        return inventoryDAO.getTotalDataCount(dto);
    }
}
