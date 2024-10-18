package kr.or.gaw.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.gaw.dao.MaterialReqDAO;
import kr.or.gaw.dto.RequestDTO;

@Service
public class MaterialReqServiceImpl implements MaterialReqService {

    @Autowired
    private MaterialReqDAO materialReqDAO;

    @Override
    public List<RequestDTO> getAllRequests() {
        return materialReqDAO.selectAll();
    }

    @Override
    public RequestDTO getRequestById(String request_id) {
        return materialReqDAO.selectById(request_id);
    }

    @Override
    public void addRequest(RequestDTO request) {
        materialReqDAO.insertRequest(request);
    }

    @Override
    public void updateRequest(RequestDTO request) {
        materialReqDAO.updateRequest(request);
    }

    @Override
    public void endRequest(String request_id) {
        materialReqDAO.endRequest(request_id);
    }

    @Override
    public int getTotalRequestCount(RequestDTO dto) {
        return materialReqDAO.selectTotalRequestCount(dto);
    }

    @Override
    public List<RequestDTO> getRequestsByPage(RequestDTO dto) {
        return materialReqDAO.selectRequestsByPage(dto);
    }
}