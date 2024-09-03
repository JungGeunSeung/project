
package geun.document.dao;

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

import geun.document.dto.DocumentDTO;


public class Doc_DAO {
	
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
	
	public List<DocumentDTO> selectAll() {
		System.out.println("Doc_DAO의 selectAll 실행");
		
		List<DocumentDTO> list = new ArrayList<DocumentDTO>();
		
        try {
        	Connection con = getConnection();
        	
        	String query = "select * from documents";
        	PreparedStatement ps = con.prepareStatement(query);
        	
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		
        		int docID = rs.getInt("document_id");
        		String userid = rs.getString("userid");
        		String title = rs.getString("title");
        		String content = rs.getString("content");
        		Date created_date = rs.getDate("created_date");
        		Date updated_date = rs.getDate("updated_date");
        		int version = rs.getInt("version");
        		
        		DocumentDTO dto = new DocumentDTO();
        		dto.setDocument_id(docID);
        		dto.setUserid(userid);
        		dto.setTitle(title);
        		dto.setContent(content);
        		dto.setCreated_date(created_date);
        		dto.setUpdated_date(updated_date);
        		dto.setVersion(version);
        		
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

	public DocumentDTO selectOne(String document_id) {
		DocumentDTO dto = null;
		Connection con = getConnection();
		
		if(con == null) return null;
		
		try {
			String sql = "select * from documents where document_id = ?";
		
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, document_id);
			
	    	ResultSet rs = ps.executeQuery();
	    	
	    	if( rs.next() ) {
	    		int docID = rs.getInt("document_id");
        		String userid = rs.getString("userid");
        		String title = rs.getString("title");
        		String content = rs.getString("content");
        		Date created_date = rs.getDate("created_date");
        		Date updated_date = rs.getDate("updated_date");
        		int version = rs.getInt("version");
        		
        		dto = new DocumentDTO();
        		dto.setDocument_id(docID);
        		dto.setUserid(userid);
        		dto.setTitle(title);
        		dto.setContent(content);
        		dto.setCreated_date(created_date);
        		dto.setUpdated_date(updated_date);
        		dto.setVersion(version);
	    	}
	    	
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int insert(DocumentDTO dto) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "INSERT INTO documents (document_id, userid, title, content, created_date, updated_date, version) "
	            		+ "VALUES bom_seq.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	            	
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            result = ps.executeUpdate();
	            
	            ps.setString(1, dto.getUserid());
	            ps.setString(2, dto.getTitle());
	            ps.setString(3, dto.getContent());
	            ps.setDate(4, dto.getCreated_date());
	            ps.setDate(5, dto.getUpdated_date());
	            ps.setInt(6,dto.getVersion());
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
	
	public int update(DocumentDTO dto) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();
	            
	            String query = "update documents set title=?, content=?, created_date=?, updated_date=?, version=? where document_id=?";
	            
	            PreparedStatement ps = con.prepareStatement(query);
	            
	            ps.setString(1, dto.getTitle());
	            ps.setString(2, dto.getContent());
	            ps.setDate(3, dto.getCreated_date());
	            ps.setDate(4, dto.getUpdated_date());
	            ps.setInt(5,dto.getVersion());
	            ps.setInt(6, dto.getDocument_id());
	            
	            result = ps.executeUpdate();
	            
	            ps.close();
	            con.close();
	            
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	public int delete(int id) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
				DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
				Connection con = dataFactory.getConnection();
				
				String query = "delete from documents where document_id=?";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setInt(1, id);
				
				result = ps.executeUpdate();
				
				ps.close();
				con.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	
	public List selectDocPage(int start, int end) {
		List list = new ArrayList();
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query =  " select * ";
		            query += " from ( ";
		            query += "    select rownum rnum, document_id, userid, title, content, created_date, updated_date, version";
		            query += "    from ( ";
		            query += "        select document_id, userid, title, content, created_date, updated_date, version ";
		            query += "        from documents ";
		            query += "        order by document_id ";
		            query += "    ) ";
		            query += " ) ";
		            
		            query += " where rnum >= ? and rnum <= ?";
            
		    PreparedStatement ps = con.prepareStatement(query);
		    
		    
		    ps.setInt(1, start);
		    ps.setInt(2, end);
		    
		    ResultSet rs = ps.executeQuery();
		    
		    while( rs.next() ) {
		    	int docID = rs.getInt("document_id");
        		String userid = rs.getString("userid");
        		String title = rs.getString("title");
        		String content = rs.getString("content");
        		Date created_date = rs.getDate("created_date");
        		Date updated_date = rs.getDate("updated_date");
        		int version = rs.getInt("version");
        		
        		DocumentDTO dto = new DocumentDTO();
        		dto.setDocument_id(docID);
        		dto.setUserid(userid);
        		dto.setTitle(title);
        		dto.setContent(content);
        		dto.setCreated_date(created_date);
        		dto.setUpdated_date(updated_date);
        		dto.setVersion(version);
                

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
	public int totalDocPage() {
		
		int result = -1;
		
		try {
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query =  "select count(*) cnt from documents ";
            
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
	public List selectDoc(String document_id) {
		List list = new ArrayList();
		
		try {
            Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM documents ";
            
            if(document_id != null && !(document_id.equals(""))) {
            	query += "where document_id= '" + document_id+"'";
            }
            
            PreparedStatement ps = con.prepareStatement(query);
            
            

            ResultSet rs = ps.executeQuery();

            while( rs.next() ) {
            	int docID = rs.getInt("document_id");
        		String userid = rs.getString("userid");
        		String title = rs.getString("title");
        		String content = rs.getString("content");
        		Date created_date = rs.getDate("created_date");
        		Date updated_date = rs.getDate("updated_date");
        		int version = rs.getInt("version");
        		
        		DocumentDTO dto = new DocumentDTO();
        		dto.setDocument_id(docID);
        		dto.setUserid(userid);
        		dto.setTitle(title);
        		dto.setContent(content);
        		dto.setCreated_date(created_date);
        		dto.setUpdated_date(updated_date);
        		dto.setVersion(version);


                list.add(dto);
            }
            
            ps.close();
            con.close();
            
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}
	
	public List selectPro(String document_id) {
		List list = new ArrayList();
			
		try {
			
			Context ctx= new InitialContext();
            DataSource dataSource =(DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

            Connection con = dataSource.getConnection();
            
            String query = "SELECT * FROM docments where document_id = ?";
            
            
            PreparedStatement ps = con.prepareStatement(query);
            
		    ps.setString(1, document_id);

            ResultSet rs = ps.executeQuery();
			
            while( rs.next() ) {
            	int docID = rs.getInt("document_id");
        		String userid = rs.getString("userid");
        		String title = rs.getString("title");
        		String content = rs.getString("content");
        		Date created_date = rs.getDate("created_date");
        		Date updated_date = rs.getDate("updated_date");
        		int version = rs.getInt("version");
        		
        		DocumentDTO dto = new DocumentDTO();
        		dto.setDocument_id(docID);
        		dto.setUserid(userid);
        		dto.setTitle(title);
        		dto.setContent(content);
        		dto.setCreated_date(created_date);
        		dto.setUpdated_date(updated_date);
        		dto.setVersion(version);


                list.add(dto);
            }
            
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return list;
	}
}
