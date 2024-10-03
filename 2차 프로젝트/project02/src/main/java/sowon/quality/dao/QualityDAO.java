package sowon.quality.dao;

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

public class QualityDAO {

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
	        	
	        	String query = "select * from qualityinspection";
	        	PreparedStatement ps = con.prepareStatement(query);
	        	
	        	ResultSet rs = ps.executeQuery();
	        	
	        	while(rs.next()) {
	        		String ins_id = rs.getString("ins_id");
	        		String production_id = rs.getString("production_id");
	        		String planid = rs.getString("planid");
	        		LocalDate ins_date = rs.getDate("ins_date").toLocalDate();
	        		String result = rs.getString("result");
	        		int defect_count = rs.getInt("defect_count");
	        		String defect_cause = rs.getString("defect_cause");
	        		String resultid = rs.getString("resultid");
	        		String taskid = rs.getString("taskid");
	        		
	        		
	        		QualityDTO dto = new QualityDTO();
	        		dto.setIns_id(ins_id);
	        		dto.setProduction_id(production_id);
	        		dto.setPlanid(planid);
	        		dto.setIns_Date(ins_date);
	        		dto.setResult( result );
	        		dto.setDefect_count( defect_count );
	        		dto.setDefect_cause( defect_cause );
	        		dto.setResultID( resultid );
	        		dto.setTaskid( taskid );
	        	
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
	
		public QualityDTO selectOne(String ins_id) {
			QualityDTO qualityDTO = null;
			Connection con = getConnection();
			
			if(con == null) return null;
			
			try {
				System.out.println("QualityDAO의 selectOne 메소드 실행 및 SQL 준비");
				
				String sql = "select * from qualityinspection where ins_id = ?";
			
				PreparedStatement ps = con.prepareStatement(sql);
				System.out.println("DAO : "+ins_id);
				ps.setString(1, ins_id);
				System.out.println("ps" + ps);
				
		    	ResultSet rs = ps.executeQuery();
		    	
		    	if( rs.next() ) {
		    		System.out.println("rs.next() 작동함");
		    		qualityDTO = new QualityDTO();
		    		qualityDTO.setIns_id(rs.getString("ins_id"));
		    		qualityDTO.setProduction_id(rs.getString("production_id"));
		    		qualityDTO.setPlanid(rs.getString("planid"));
		    		qualityDTO.setIns_Date(rs.getDate("ins_date").toLocalDate());
		    		qualityDTO.setResult(rs.getString("result"));
		    		qualityDTO.setDefect_count(rs.getInt("defect_count"));
		    		qualityDTO.setDefect_cause(rs.getString("defect_cause"));
		    		qualityDTO.setResultID(rs.getString("resultid"));
		    		qualityDTO.setTaskid(rs.getString("taskid"));
		    	
		    	}
			}catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("qualityDTO : "+qualityDTO);
			return qualityDTO;
		}		
		public int update(QualityDTO dto) {
		    int result = 0;
		    try {
		        Context ctx = new InitialContext();
		        DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
		        Connection con = dataFactory.getConnection();
		        
		        String query = "UPDATE qualityinspection SET ins_date=?, result=?, defect_count=?, defect_cause=? WHERE ins_ID=?";
		        PreparedStatement ps = con.prepareStatement(query);
		        
		        LocalDate localDate = dto.getIns_date();
		        java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
		        
		        ps.setDate(1, sqlDate);
		        ps.setString(2, dto.getResult());
		        ps.setInt(3, dto.getDefect_count());
		        ps.setString(4, dto.getDefect_cause());
		        ps.setString(5, dto.getIns_id());
		        
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
				
				String query = "delete from qualityinspection where ins_id=?";
				
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
	                    query += "    select rownum rnum, ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, resultid, taskid";
	                    query += "    from ( ";
	                    query += "        select ins_id, production_id, planid, ins_date, result, defect_count, defect_cause, resultid, taskid ";
	                    query += "        from qualityinspection ";
	                    query += "        order by ins_id ";
	                    query += "    ) ";
	                    query += " ) ";
	                    query += " where rnum >= ? and rnum <= ?";
	            
	            ps = con.prepareStatement(query);
	            
	            ps.setInt(1, start);
	            ps.setInt(2, end);
	            
	            rs = ps.executeQuery();
	            
	            while(rs.next()) {
	                String ins_id = rs.getString("ins_id");
	                String production_id = rs.getString("production_id");
	                String planid = rs.getString("planid");
	                LocalDate ins_date = rs.getDate("ins_date").toLocalDate();
	                String result = rs.getString("result");
	                int defect_count = rs.getInt("defect_count");
	                String defect_cause = rs.getString("defect_cause");
	                String resultid = rs.getString("resultid");
	                String taskid = rs.getString("taskid");
	                
	                QualityDTO dto = new QualityDTO();
	                dto.setIns_id(ins_id);
	                dto.setProduction_id(production_id);
	                dto.setPlanid(planid);
	                dto.setIns_Date(ins_date);
	                dto.setResult(result);
	                dto.setDefect_count(defect_count);
	                dto.setDefect_cause(defect_cause);
	                dto.setResultID(resultid);
	                dto.setTaskid(taskid);
	            
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
	            
	            String query =  "select count(*) cnt from qualityinspection ";
	            
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
	            
	            String query = "SELECT * FROM qualityinspection ";
	            
	            if(production_id != null && !(production_id.equals(""))) {
	                query += " where production_id= '" + production_id + "'";
	            }
	            
	            ps = con.prepareStatement(query);

	            rs = ps.executeQuery();

	            while(rs.next()) {
	                String ins_id = rs.getString("ins_id");
	                String prod_id = rs.getString("production_id");
	                String planid = rs.getString("planid");
	                LocalDate ins_date = rs.getDate("ins_date").toLocalDate();
	                String result = rs.getString("result");
	                int defect_count = rs.getInt("defect_count");
	                String defect_cause = rs.getString("defect_cause");
	                String resultid = rs.getString("resultid");
	                String taskid = rs.getString("taskid");
	                
	                QualityDTO dto = new QualityDTO();
	                dto.setIns_id(ins_id);
	                dto.setProduction_id(prod_id);
	                dto.setPlanid(planid);
	                dto.setIns_Date(ins_date);
	                dto.setResult(result);
	                dto.setDefect_count(defect_count);
	                dto.setDefect_cause(defect_cause);
	                dto.setResultID(resultid);
	                dto.setTaskid(taskid);

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
	            
	            String query = "SELECT * FROM qualityinspection WHERE production_id = ?";
	            
	            ps = con.prepareStatement(query);
	            
	            ps.setString(1, production_id);

	            rs = ps.executeQuery();
	            
	            while(rs.next()) {
	                String ins_id = rs.getString("ins_id");
	                String prod_id = rs.getString("production_id");
	                String planid = rs.getString("planid");
	                LocalDate ins_date = rs.getDate("ins_date").toLocalDate();
	                String result = rs.getString("result");
	                int defect_count = rs.getInt("defect_count");
	                String defect_cause = rs.getString("defect_cause");
	                String resultid = rs.getString("resultid");
	                String taskid = rs.getString("taskid");
	                
	                QualityDTO dto = new QualityDTO();
	                dto.setIns_id(ins_id);
	                dto.setProduction_id(prod_id);
	                dto.setPlanid(planid);
	                dto.setIns_Date(ins_date);
	                dto.setResult(result);
	                dto.setDefect_count(defect_count);
	                dto.setDefect_cause(defect_cause);
	                dto.setResultID(resultid);
	                dto.setTaskid(taskid);
	            
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

	        return list;  // 결과 반환
	    }
	    public QualityDTO get(String id) {
	    	QualityDAO dao = new QualityDAO();
	        return dao.selectOne(id);  // tno 속성을 사용하지 않도록 수정
	    }

	    public int deleteSelect(List ids) {
			System.out.println("Doc_DAO의 deleteSelect 실행");
			
			int result = 0;
		    if (ids == null || ids.isEmpty()) {
		        // 리스트가 비어있으면 그대로 리턴
		        return result;
		    }
			
			try {
				Context ctx = new InitialContext();
				DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
				Connection con = dataFactory.getConnection();
				
				// IN 절에 사용할 ?의 개수를 동적으로 만듦
		        StringBuilder query = new StringBuilder("DELETE FROM qualityinspection WHERE ins_id IN (");
		        for (int i = 0; i < ids.size(); i++) {
		            query.append("?");
		            if (i < ids.size() - 1) {
		                query.append(", "); // 각 ? 사이에 쉼표 추가
		            }
		        }
		        query.append(")");

		        // PreparedStatement 생성
		        PreparedStatement ps = con.prepareStatement(query.toString());

		        // PreparedStatement에 ids 값을 바인딩
		        for (int i = 0; i < ids.size(); i++) {
		            ps.setString(i + 1, (String) ids.get(i));  // IN 절에 ? 위치에 각 ID를 바인딩
		        }
				
				result = ps.executeUpdate();
				
				ps.close();
				con.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
	   
	
}
