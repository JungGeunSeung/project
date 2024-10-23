package kr.or.gaw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gaw.dao.StockDAO;
import kr.or.gaw.dto.ClientDTO;
import kr.or.gaw.dto.StockMoveDTO;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	StockDAO stockDAO;
	
	@Override
	public List<StockMoveDTO> selectStock(){
		List<StockMoveDTO> list = stockDAO.selectStock();
		System.out.println("서비스 들어옴 :" + list);
		return list;
	}
	
	@Override
	public List<ClientDTO> selectClient(){
		List<ClientDTO> list = stockDAO.selectClient();
		System.out.println("서비스 들어옴 :" + list);
		return list;
	}
	
	@Override
    public int createClient(ClientDTO client) {
        return stockDAO.createClient(client);
    }
	
	@Override
	public int updateClient(ClientDTO client) {
	    return stockDAO.updateClient(client); // DAO 호출
	}
	
	@Override
	public int deleteClient(String clientId) {
	    System.out.println("서비스롤러 삭제 "+clientId);

	    return stockDAO.deleteClient(clientId); // DAO 호출
	}

}
