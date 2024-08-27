package geun.BOM.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import geun.BOM.dto.BOM_DTO;

public class BOM_DAO {
	
	private Connection getConnection () {
		
		Connection con = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@125.181.132.133:51521:xe";
        String user = "scott2_5";
        String password = "tiger";
        
        try {
        	Class.forName(driver);
        	
        	con = DriverManager.getConnection(url, user, password);
        	} catch(Exception e) {
        		e.printStackTrace();
        	}
		return con;
	}
	
	public List<BOM_DTO> selectAll() {
		System.out.println("BOM_DAO의 selectAll 실행");
		
		List<BOM_DTO> list = new ArrayList<BOM_DTO>();
		
        try {
        	Connection con = getConnection();
        	
        	String query = "select * from bom";
        	PreparedStatement ps = con.prepareStatement(query);
        	
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		
        		String id = rs.getString("bom_id");
        		String prodoction_id = rs.getString("production_id");
        		String mid = rs.getString("mid");
        		int bom_quantity = rs.getInt("bom_quantity");
        		
        		
        		BOM_DTO dto = new BOM_DTO();
        		dto.setBom_id(id);
        		dto.setProduction_id(prodoction_id);
        		dto.setMid(mid);
        		dto.setBom_quantity(bom_quantity);
        		
        		list.add(dto);
        		
        	}
        	rs.close();
        	ps.close();
        	con.close();
        	
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return list;
	}

	public BOM_DTO selectOne(String bomid) {
		BOM_DTO dto = null;
		Connection con = getConnection();
		
		if(con == null) return null;
		
		try {
			String sql = "select * from bom where bom_id = ?";
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bomid);
			
	    	ResultSet rs = ps.executeQuery();
	    	
	    	if( rs.next() ) {
		    	String id = rs.getString("bom_id");
	    		String prodoction_id = rs.getString("production_id");
	    		String mid = rs.getString("mid");
	    		int bom_quantity = rs.getInt("bom_quantity");
	    		
	    		dto = new BOM_DTO();
	    		dto.setBom_id(id);
	    		dto.setProduction_id(prodoction_id);
	    		dto.setMid(mid);
	    		dto.setBom_quantity(bom_quantity);
	    	}
	    	
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
