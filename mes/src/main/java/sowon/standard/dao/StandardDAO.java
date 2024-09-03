package sowon.standard.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sowon.quality.dto.QualityDTO;

public class StandardDAO {

		private Connection getConnection () {
			
			Connection con = null;
			
			String driver = "oracle.jdbc.driver.OracleDriver";
	        String url = "jdbc:oracle:thin:@125.181.132.133:51521:xe";
	        String user = "scott2_8";
	        String password = "tiger";
	        
	        try {
	        	Class.forName(driver);
	        	
	        	con = DriverManager.getConnection(url, user, password);
	        	} catch(Exception e) {
	        		e.printStackTrace();
	        	}
			return con;
		}

		public List<QualityDTO> selectAll() {
			System.out.println("DAO 실행");
			
			List<QualityDTO> list = new ArrayList<QualityDTO>();
			
	        
	        try {
	        	
	        	Connection con = getConnection();
	        	
	        	String query = "select * from QualityStandards";
	        	PreparedStatement ps = con.prepareStatement(query);
	        	
	        	ResultSet rs = ps.executeQuery();
	        	
	        	while(rs.next()) {
	        		String qualit_id = rs.getString("quality_id");
	        		String title = rs.getString("title");
	        		String mrg = rs.getString("mgr");
	        		String insti = rs.getString("insti");
	        		LocalDate revision = rs.getDate("revision").toLocalDate();
	        		
	        		
	        		QualityDTO dto = new QualityDTO();
	        		//dto.setQuality_id(quality_id);
	        		//dto.setTitle(title);
	        		//dto.setMgr(mgr);
	        		//dto.setInsti(insti);
	        		//dto.setRevision(revision);
	        		
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
	
		public QualityDTO selectOne(String quality_id) {
			QualityDTO qualityDTO = null;
			Connection con = getConnection();
			
			if(con == null) return null;
			
			try {
				System.out.println("QualityDAO의 selectOne 메소드 실행 및 SQL 준비");
				
				String sql = "select * from QualityStandards where qualit_id = ?";
			
				PreparedStatement ps = con.prepareStatement(sql);
				System.out.println("DAO : "+quality_id);
				ps.setString(1, quality_id);
				System.out.println("ps" + ps);
				
		    	ResultSet rs = ps.executeQuery();
		    	
		    	if( rs.next() ) {
		    		System.out.println("rs.next() 작동함");
		    		qualityDTO = new QualityDTO();
		    		qualityDTO.setIns_id(rs.getString("quality_id"));
		    		qualityDTO.setProduction_id(rs.getString("title"));
		    		qualityDTO.setPlanid(rs.getString("mrg"));
		    		qualityDTO.setPlanid(rs.getString("insti"));
		    		qualityDTO.setIns_Date(rs.getDate("revision").toLocalDate());
		    		
		    	
		    	}
			}catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("standardDTO : "+standardDTO);
			return qualityDTO;
		}		
		public int update(QualityDTO dto) {
		    int result = 0;
		    try {
		        Context ctx = new InitialContext();
		        DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
		        Connection con = dataFactory.getConnection();
		        
		        String query = "UPDATE QualityStandards SET title=?, mgr=?, insti=? revision=? WHERE quality_id=?";
		        PreparedStatement ps = con.prepareStatement(query);
		        
		        // LocalDate를 java.sql.Date로 변환
		        LocalDate localDate = dto.getIns_date();
		        java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		        
		        // DTO에서 값 가져오기 및 PreparedStatement에 설정
		        //ps.setString(1, dto.getTitle());
		        //ps.setString(2, dto.getMgr());
		       // ps.setString(3, dto.getInsti());
		        //ps.setDate(4, dto.getRevision());
		        
		        
		        result = ps.executeUpdate();
		        System.out.println("업데이트된 행 수: " + result);
		        
		        ps.close();
		        con.close();
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
		    
		    return result;
		}
		
		public int delete(String ins_id) {
			
			int result = 0;
			try {
				Context ctx = new InitialContext();
				DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
				Connection con = dataFactory.getConnection();
				
				String query = "delete from QualityStandards where quality_id=?";
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, ins_id);
				
				result = ps.executeUpdate();
				
				ps.close();
				con.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	    
		public List selectQualityPage(int start, int end) {
	        System.out.println("QualityDAO의 selectQualityPage메소드 실행");
			
			List list = new ArrayList();
	        
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query =  " select * ";
	                    query += " from ( ";
	                    query += "    select rownum rnum, quality_id, title, mgr, insti, revision";
	                    query += "    from ( ";
	                    query += "        select quality_id, title, mgr, insti,revision ";
	                    query += "        from QualityStandards ";
	                    query += "        order by quality_id ";
	                    query += "    ) ";
	                    query += " ) ";
	                    query += " where rnum >= ? and rnum <= ?";
	            
	            ps = con.prepareStatement(query);
	            
	            ps.setInt(1, start);
	            ps.setInt(2, end);
	            
	            rs = ps.executeQuery();
	            
	            while(rs.next()) {
	                String quality_id = rs.getString("quality_id");
	                String title = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();
	              
	                
	                QualityDTO dto = new QualityDTO();
//	                dto.setQuality_id(quality_id);
//	                dto.setTitle(title);
//	                dto.setMgr(mgr);
//	                dto.setInsti(insti);
//	                dto.setRevision(revision);
	                
	                list.add(dto);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return list;
	    }

	    // 전체 데이터베이스의 데이터 개수를 구하는 메소드
	    public int totalQualityPage() {
	        
	        int result = -1;
	        
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query =  "select count(*) cnt from QualityStandards ";
	            
	            ps = con.prepareStatement(query);
	            
	            rs = ps.executeQuery();
	            
	            if(rs.next()) {
	                result = rs.getInt("cnt");
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return result;
	    }

	    // 주소창에 quality_ID의 값을 넣어 특정 quality코드를 찾는 메소드
	    public List selectQuality(String production_id) {
	        List list = new ArrayList();
	        
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query = "SELECT * FROM QualityStandards ";
	            
	            if(production_id != null && !(production_id.equals(""))) {
	                query += " where quality_id= '" + production_id + "'";
	            }
	            
	            ps = con.prepareStatement(query);

	            rs = ps.executeQuery();

	            while(rs.next()) {
	                String quality_id = rs.getString("quality_id");
	                String title = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();
	                
	                QualityDTO dto = new QualityDTO();
//	                dto.setQuality_id(quality_id);
//	                dto.setTitle(title);
//	                dto.setMgr(mgr);
//	                dto.setInsti(insti);
//	                dto.setRevision(revision);
	               

	                list.add(dto);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return list;
	    }

	    public List selectPro(String production_id) {
	        List list = new ArrayList();
	            
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query = "SELECT * FROM QualityStandards WHERE quality_id = ?";
	            
	            ps = con.prepareStatement(query);
	            
	            ps.setString(1, production_id);

	            rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	 String quality_id = rs.getString("quality_id");
		             String title = rs.getString("title");
	                 String mgr = rs.getString("mgr");
	                 String insti = rs.getString("insti");
	                 LocalDate revision = rs.getDate("revision").toLocalDate();
	                
	                QualityDTO dto = new QualityDTO();
//	                dto.setQuality_id(quality_id);
//	                dto.setTitle(title);
//	                dto.setMgr(mgr);
//	                dto.setInsti(insti);
//	                dto.setRevision(revision);
//	            
	                list.add(dto);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (ps != null) ps.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return list;
	    }
	    public QualityDTO get(String id) {
	        StandardDAO dao = new StandardDAO();
	        return dao.selectOne(id);  // tno 속성을 사용하지 않도록 수정
	    }

	
}
