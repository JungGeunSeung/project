package sowon.quality.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;



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
	
		public QualityDTO selectOne(String tno) {
			QualityDTO qualityDTO = null;
			// DB 접속
			Connection con = getConnection();
			
			// 접속 되지 않는 다면 null 리턴하여 메소드 종료
			if(con == null) return null;
			
			try {
				
				// sql 준비
				String sql = "select * from qualityinspection where ins_id = ?";
			
				PreparedStatement ps = con.prepareStatement(sql);
		    	// ?를 값으로 채워줌
				// 첫번째 전달인자는 ?의 순서
				// 글씨라면 setString 알아서 ''로 감싸준다.
				ps.setString(1, tno);
				
				// sql 실행 및 결과 확보
		    	ResultSet rs = ps.executeQuery();
		    	
		    	//결과 활용
		    	
		    	// rs.next() : 첫번째 줄
		    	if( rs.next() ) {

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
			
			return qualityDTO;
		}		
}
