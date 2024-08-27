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
	        	Class.forName(driver);
	        	
	        	Connection con = DriverManager.getConnection(url, user, password);
	        	
	        	String query = "select * from tbl_todo";
	        	PreparedStatement ps = con.prepareStatement(query);
	        	
	        	ResultSet rs = ps.executeQuery();
	        	
	        	while(rs.next()) {
	        		int tno = rs.getInt("tno");
	        		String title = rs.getString("title");
	        		String finished = rs.getString("finished");
	        		LocalDate duedate = rs.getDate("duedate").toLocalDate();
	        		
	        		
	        		QualityDTO dto = new QualityDTO();
	        		dto.setTno(tno);
	        		dto.setTitle(title);
	        		dto.setDueDate(duedate);
	        		dto.setFinished( finished.equals("Y") ? true : false );
	        	
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
	
		public QualityDTO selectOne(int tno) {
			QualityDTO qualityDTO = null;
			// DB 접속
			Connection con = getConnection();
			
			// 접속 되지 않는 다면 null 리턴하여 메소드 종료
			if(con == null) return null;
			return null;
		}	
		
}
