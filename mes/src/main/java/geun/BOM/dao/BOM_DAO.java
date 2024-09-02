
package geun.BOM.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	public int insert(BOM_DTO dto) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "INSERT INTO bom (bom_id, production_id, mid, bom_quantity) "
	            		+ "VALUES ('BOM' || TO_CHAR(bom_seq.NEXTVAL, 'FM000'), ?, ?, ?)";
	            
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            ps.setString(1, dto.getProduction_id());
	            
	            ps.setString(2, dto.getMid());
	            
	            ps.setInt(3, dto.getBom_quantity());
	            
	            result = ps.executeUpdate();
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
	public int update(BOM_DTO dto) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "update bom set production_id=?, mid=?, bom_quantity=? where bom_id=?";
	            
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            ps.setString(1, dto.getProduction_id());
	            
	            ps.setString(2, dto.getMid());
	            
	            ps.setInt(3, dto.getBom_quantity());
	            
	            ps.setString(4, dto.getBom_id());
	            
	            result = ps.executeUpdate();
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	public int delete(String id) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
				DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
				Connection con = dataFactory.getConnection();
				
				String query = "delete from bom where bom_id=?";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, id);
				
				result = ps.executeUpdate();
				
				ps.close();
				con.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	public List selectBOMPage(int start, int end) {
		List list = new ArrayList();
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query =  " select * ";
		            query += " from ( ";
		            query += "    select rownum rnum, bom_id, production_id, mid, bom_quantity";
		            query += "    from ( ";
		            query += "        select bom_id, production_id, mid, bom_quantity ";
		            query += "        from bom ";
		            query += "        order by bom_id ";
		            query += "    ) ";
		            query += " ) ";
		            
		            query += " where rnum >= ? and rnum <= ?";
            
		    PreparedStatement ps = con.prepareStatement(query);
		    
		    
		    ps.setInt(1, start);
		    ps.setInt(2, end);
		    
		    ResultSet rs = ps.executeQuery();
		    
		    while( rs.next() ) {
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
		    
		    
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	// 전체 데이터베이스의 데이터 개수를 구하는 메소드
	public int totalBOMPage() {
		
		int result = -1;
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query =  "select count(*) cnt from bom ";
            
            PreparedStatement ps = con.prepareStatement(query);
		    
		    
		    ResultSet rs = ps.executeQuery();
		    
		    while( rs.next() ) {
                result = rs.getInt("cnt");
            }
            
		    rs.close();
            ps.close();
            con.close();
		    
		    
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 주소창에 BOM_ID의 값을 넣어 특정 BOM코드를 찾는 메소드
	public List selectBOM(String production_id) {
		List list = new ArrayList();
		
		try {
            Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM bom ";
            
            if(production_id != null && !(production_id.equals(""))) {
            	query += "where production_id= '" + production_id+"'";
            }
            
            PreparedStatement ps = con.prepareStatement(query);
            
            

            ResultSet rs = ps.executeQuery();

            while( rs.next() ) {
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
            
            ps.close();
            con.close();
            
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public List selectPro(String production_id) {
		List list = new ArrayList();
			
		try {
			
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM bom where production_id = ?";
            
            
            PreparedStatement ps = con.prepareStatement(query);
            
		    ps.setString(1, production_id);

            ResultSet rs = ps.executeQuery();
			
            while( rs.next() ) {
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
            
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
}
