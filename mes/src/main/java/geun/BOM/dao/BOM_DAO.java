package geun.BOM.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
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
		System.out.println("DAO 실행");
		
		List<BOM_DTO> list = new ArrayList<BOM_DTO>();
		
		String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@125.181.132.133:51521:xe";
        String user = "scott2_5";
        String password = "tiger";
        
        try {
        	Class.forName(driver);
        	
        	Connection con = DriverManager.getConnection(url, user, password);
        	
        	String query = "select * from tbl_todo order by tno asc";
        	PreparedStatement ps = con.prepareStatement(query);
        	
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		int tno = rs.getInt("tno");
        		String title = rs.getString("title");
        		String finished = rs.getString("finished");
        		LocalDate duedate = rs.getDate("duedate").toLocalDate();
        		
        		
        		BOM_DTO dto = new BOM_DTO();
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

public BOM_DTO selectOne(int tno) {
	BOM_DTO todoDTO = null;
	// DB 접속
	Connection con = getConnection();
	
	// 접속 되지 않는 다면 null 리턴하여 메소드 종료
	if(con == null) return null;
	
	try {
		
		// sql 준비
		String sql = "select * from tbl_todo where tno = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);
    	// ?를 값으로 채워줌
		// 첫번째 전달인자는 ?의 순서
		// 글씨라면 setString 알아서 ''로 감싸준다.
		ps.setInt(1, tno);
		
		// sql 실행 및 결과 확보
    	ResultSet rs = ps.executeQuery();
    	
    	//결과 활용
    	
    	// rs.next() : 첫번째 줄
    	if( rs.next() ) {
    		todoDTO = new BOM_DTO();
    		todoDTO.setTno(rs.getInt("tno"));
    		todoDTO.setTitle(rs.getString("title"));
    		todoDTO.setDueDate( rs.getDate("duedate").toLocalDate());
    		todoDTO.setFinished( rs.getString("finished").equals("Y") ? true : false );
    	}	    	
    	
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
		return todoDTO;
	}
}
