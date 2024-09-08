
package geun.BOM.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import geun.BOM.dto.EquipmentDTO;


public class EquipmentDAO {
	
	private Connection getConnection () {
		System.out.println("DB연결 getConnection() 실행");
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
	
	public List<EquipmentDTO> selectAll() {
		System.out.println("EquipmentDAO의 selectAll 실행");
		
		List<EquipmentDTO> list = new ArrayList<EquipmentDTO>();
		
        try {
        	Connection con = getConnection();
        	
        	String query = "select * from equipment order by equiid";
        	PreparedStatement ps = con.prepareStatement(query);
        	
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		
        		String equiID = rs.getString("equiID").trim();
        		String equiName = rs.getString("equiName").trim();
        		String equiImg = rs.getString("equiImg").trim();
        		String equiType = rs.getString("equiType").trim();
        		String equiDesc = rs.getString("equiDesc").trim();
        		Date sellDate = rs.getDate("sellDate");
        		String equiLoc = rs.getString("equiLoc").trim();
        		String status = rs.getString("status").trim();
        		String userid = rs.getString("userid").trim();
        		
        		
        		
        		EquipmentDTO dto = new EquipmentDTO();
        		
        		dto.setEquiID(equiID);
        		dto.setEquiname(equiName);
        		dto.setEquiImg(equiImg);
        		dto.setEquiType(equiType);
        		dto.setEquiDesc(equiDesc);
        		dto.setSellDate(sellDate);
        		dto.setEquiLoc(equiLoc);
        		dto.setStatus(status);
        		dto.setUserid(userid);
        		
        		
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

	public EquipmentDTO selectOne(String document_id) {
		System.out.println("EquipmentDAO의 selectOne 실행");
		EquipmentDTO dto = null;
		Connection con = getConnection();
		
		if(con == null) return null;
		
		try {
			String sql = "select * from equipment where equiid = ? order by equiid";
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, document_id);
			
	    	ResultSet rs = ps.executeQuery();
	    	
	    	if( rs.next() ) {
	    		String equiID = rs.getString("equiID").trim();
        		String equiName = rs.getString("equiName").trim();
        		String equiImg = rs.getString("equiImg").trim();
        		String equiType = rs.getString("equiType").trim();
        		String equiDesc = rs.getString("equiDesc").trim();
        		Date sellDate = rs.getDate("sellDate");
        		String equiLoc = rs.getString("equiLoc").trim();
        		String status = rs.getString("status").trim();
        		String userid = rs.getString("userid").trim();
        		
        		dto = new EquipmentDTO();
        		dto.setEquiID(equiID);
        		dto.setEquiname(equiName);
        		dto.setEquiImg(equiImg);
        		dto.setEquiType(equiType);
        		dto.setEquiDesc(equiDesc);
        		dto.setSellDate(sellDate);
        		dto.setEquiLoc(equiLoc);
        		dto.setStatus(status);
        		dto.setUserid(userid);
        		
        		
	    	}
	    	
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insert(EquipmentDTO dto) {
		System.out.println("EquipmentDAO의 insert 실행");
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "INSERT INTO equipment (equiID, equiname, equiimg, equitype, equidesc, selldate, equiloc, status, userid) "
	            		+ "VALUES ( 'EQUIP' || TO_CHAR(equip_seq.NEXTVAL, 'FM000'), ?, ?, ?, ?, ?, ?, ?, ?)";
	            	
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            
	            ps.setString(1, dto.getEquiname());
	            ps.setString(2, dto.getEquiImg());
	            ps.setString(3, dto.getEquiType());
	            ps.setString(4, dto.getEquiDesc());
	            ps.setDate(5, dto.getSellDate());
	            ps.setString(6, dto.getEquiLoc());
	            ps.setString(7, dto.getStatus());
	            ps.setString(8, dto.getUserid());
	            
	            result = ps.executeUpdate();
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
	public int update(EquipmentDTO dto) {
		System.out.println("EquipmentDAO의 update 실행");
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "UPDATE equipment SET equiName = ?, equiImg = ?, equiType = ?, equiDesc = ?, sellDate = ?, equiLoc = ?, status = ? WHERE equiID = ?";
	            
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            ps.setString(1, dto.getEquiname());
	            ps.setString(2, dto.getEquiImg());
	            ps.setString(3, dto.getEquiType());
	            ps.setString(4, dto.getEquiDesc());
	            ps.setDate(5, dto.getSellDate());
	            ps.setString(6, dto.getEquiLoc());
	            ps.setString(7, dto.getStatus());
	            ps.setString(8, dto.getEquiID());
	            
	            result = ps.executeUpdate();
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	public int delete(String id) {
		System.out.println("EquipmentDAO의 delete 실행");
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
				DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
				Connection con = dataFactory.getConnection();
				
				String query = "delete from equipment where equiid=?";
				
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
	
	public int deleteSelect(List ids) {
		System.out.println("EquipmentDAO의 deleteSelect 실행");
		
		int result = 0;
	    if (ids == null || ids.isEmpty()) {
	        return result;
	    }
		
		try {
			Context ctx = new InitialContext();
			DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			Connection con = dataFactory.getConnection();
			
	        StringBuilder query = new StringBuilder("DELETE FROM equipment WHERE equiid IN (");
	        for (int i = 0; i < ids.size(); i++) {
	            query.append("?");
	            if (i < ids.size() - 1) {
	                query.append(", ");
	            }
	        }
	        query.append(")");
	        PreparedStatement ps = con.prepareStatement(query.toString());

	        for (int i = 0; i < ids.size(); i++) {
	            ps.setString(i + 1, (String) ids.get(i));
	        }
			
			result = ps.executeUpdate();
			
			ps.close();
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List selectEquipPage(int start, int end) {
		System.out.println("EquipmentDAO의 selectEquipPage 실행");
		List list = new ArrayList();
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM "
            	    + "(SELECT ROWNUM AS rnum, equiid, equiname, equiimg, equitype, equidesc, selldate, equiloc, status, userid"
            	    + " FROM ("
            	    + " SELECT equiID AS equiid, equiName AS equiname, equiImg, equiType, equiDesc, sellDate, equiLoc, status, userid"
            	    + " FROM equipment"
            	    + " ORDER BY equiid)"
            	    + " WHERE ROWNUM <= ?)"
            	    + " WHERE rnum >= ?";
            
		    PreparedStatement ps = con.prepareStatement(query);
		    
		    System.out.println("start : " + start +", end : " + end);
		    
		    ps.setInt(1, end);
		    ps.setInt(2, start);
		    
		    ResultSet rs = ps.executeQuery();
		    
		    int count = 0;
		    while( rs.next() ) {
		    	String equiID = rs.getString("equiid").trim();
        		String equiName = rs.getString("equiname").trim();
        		String equiImg = rs.getString("equiImg").trim();
        		String equiType = rs.getString("equiType").trim();
        		String equiDesc = rs.getString("equiDesc").trim();
        		Date sellDate = rs.getDate("sellDate");
        		String equiLoc = rs.getString("equiLoc").trim();
        		String status = rs.getString("status").trim();
        		String userid = rs.getString("userid").trim();
//        		
        		
        		
        		EquipmentDTO dto = new EquipmentDTO();
        		
        		dto.setEquiID(equiID);
        		dto.setEquiname(equiName);
        		dto.setEquiImg(equiImg);
        		dto.setEquiType(equiType);
        		dto.setEquiDesc(equiDesc);
        		dto.setSellDate(sellDate);
        		dto.setEquiLoc(equiLoc);
        		dto.setStatus(status);
        		dto.setUserid(userid);
//        		
        		
        		list.add(dto);
        		
        		count++;
            }
            System.out.println("총 반복 횟수 : "+ count);
		    rs.close();
            ps.close();
            con.close();
		    
		    
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
	
	// 전체 데이터베이스의 데이터 개수를 구하는 메소드
	public int totalEquipPage() {
		System.out.println("EquipmentDAO의 totalEquipPage 실행");
		
		int result = -1;
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query =  "select count(*) cnt from equipment ";
            
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
	public List selectEquip(String title) {
		System.out.println("EquipmentDAO의 selectEquip 실행");
		List list = new ArrayList();
		
		try {
            Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM equipment ";
            
            if(title != null && !(title.equals(""))) {
            	query += "where lower(equiname) like lower('%" + title+"%')";
            }
            System.out.println("query : " + query);
            PreparedStatement ps = con.prepareStatement(query);
            
            

            ResultSet rs = ps.executeQuery();

            while( rs.next() ) {
            	String equiID = rs.getString("equiID").trim();
        		String equiName = rs.getString("equiName").trim();
        		String equiImg = rs.getString("equiImg").trim();
        		String equiType = rs.getString("equiType").trim();
        		String equiDesc = rs.getString("equiDesc").trim();
        		Date sellDate = rs.getDate("sellDate");
        		String equiLoc = rs.getString("equiLoc").trim();
        		String status = rs.getString("status").trim();
        		String userid = rs.getString("userid").trim();
        		
        		
        		
        		EquipmentDTO dto = new EquipmentDTO();
        		
        		dto.setEquiID(equiID);
        		dto.setEquiname(equiName);
        		dto.setEquiImg(equiImg);
        		dto.setEquiType(equiType);
        		dto.setEquiDesc(equiDesc);
        		dto.setSellDate(sellDate);
        		dto.setEquiLoc(equiLoc);
        		dto.setStatus(status);
        		dto.setUserid(userid);
        		
        		
        		list.add(dto);
            }
            
            ps.close();
            con.close();
            
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public List selectPro(String equiid) {
		System.out.println("EquipmentDAO의 selectPro 실행");
		List list = new ArrayList();
			
		try {
			
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM equipment where equiid = ?";
            
            
            PreparedStatement ps = con.prepareStatement(query);
            
		    ps.setString(1, equiid);

            ResultSet rs = ps.executeQuery();
			
            while( rs.next() ) {
            	String equiID = rs.getString("equiID").trim();
        		String equiName = rs.getString("equiName").trim();
        		String equiImg = rs.getString("equiImg").trim();
        		String equiType = rs.getString("equiType").trim();
        		String equiDesc = rs.getString("equiDesc").trim();
        		Date sellDate = rs.getDate("sellDate");
        		String equiLoc = rs.getString("equiLoc").trim();
        		String status = rs.getString("status").trim();
        		String userid = rs.getString("userid").trim();
        		
        		
        		
        		EquipmentDTO dto = new EquipmentDTO();
        		
        		dto.setEquiID(equiID);
        		dto.setEquiname(equiName);
        		dto.setEquiImg(equiImg);
        		dto.setEquiType(equiType);
        		dto.setEquiDesc(equiDesc);
        		dto.setSellDate(sellDate);
        		dto.setEquiLoc(equiLoc);
        		dto.setStatus(status);
        		dto.setUserid(userid);
        		
        		
        		list.add(dto);
            }
            
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
}
