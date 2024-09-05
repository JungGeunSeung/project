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


import sowon.quality.dto.StandardDTO;

public class StandardDAO {

	   private Connection getConnection() {
	        Connection con = null;
	        String driver = "oracle.jdbc.driver.OracleDriver";
	        String url = "jdbc:oracle:thin:@125.181.132.133:51521:xe";
	        String user = "scott2_8";
	        String password = "tiger";

	        try {
	            Class.forName(driver);
	            con = DriverManager.getConnection(url, user, password);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return con;
	    }

	    public List<StandardDTO> selectAll() {
	        System.out.println("DAO 실행");

	        List<StandardDTO> list = new ArrayList<>();

	        try {
	            Connection con = getConnection();
	            String query = "select * from qualitystandards";
	            PreparedStatement ps = con.prepareStatement(query);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                String quality_id = rs.getString("quality_id");
	                String title = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();

	                StandardDTO dto = new StandardDTO();
	                dto.setQuality_id(quality_id);
	                dto.setTitle(title);
	                dto.setMgr(mgr);
	                dto.setInsti(insti);
	                dto.setRevision(revision);

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

	    public StandardDTO selectOne(String quality_id) {
	        StandardDTO standardDTO = null;
	        Connection con = getConnection();

	        if (con == null) return null;

	        try {
	            System.out.println("StandardDAO의 selectOne 메소드 실행 및 SQL 준비");

	            String sql = "select * from qualitystandards where quality_id = ?";

	            PreparedStatement ps = con.prepareStatement(sql);
	            System.out.println("DAO : " + quality_id);
	            ps.setString(1, quality_id);
	            System.out.println("ps" + ps);

	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                System.out.println("rs.next() 작동함");
	                standardDTO = new StandardDTO();
	                standardDTO.setQuality_id(rs.getString("quality_id"));
	                standardDTO.setTitle(rs.getString("title"));
	                standardDTO.setMgr(rs.getString("mgr"));
	                standardDTO.setInsti(rs.getString("insti"));
	                standardDTO.setRevision(rs.getDate("revision").toLocalDate());
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        System.out.println("standardDTO : " + standardDTO);
	        return standardDTO;
	    }

	    public int update(StandardDTO dto) {
	        int result = 0;
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();

	            String query = "UPDATE qualitystandards SET title=?, mgr=?, insti=?, revision=? WHERE quality_id=?";
	            PreparedStatement ps = con.prepareStatement(query);

	            LocalDate localDate = dto.getRevision();
	            java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

	            ps.setString(1, dto.getTitle());
	            ps.setString(2, dto.getMgr());
	            ps.setString(3, dto.getInsti());
	            ps.setDate(4, sqlDate);
	            ps.setString(5, dto.getQuality_id());

	            result = ps.executeUpdate();
	            System.out.println("업데이트된 행 수: " + result);

	            ps.close();
	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    public int delete(String quality_id) {
	        int result = 0;
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataFactory = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
	            Connection con = dataFactory.getConnection();

	            String query = "delete from qualitystandards where quality_id=?";

	            PreparedStatement ps = con.prepareStatement(query);

	            ps.setString(1, quality_id);

	            result = ps.executeUpdate();

	            ps.close();
	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    public List<StandardDTO> selectStandardPage(int start, int end) {
	        System.out.println("StandardDAO의 selectStandardPage메소드 실행");

	        List<StandardDTO> list = new ArrayList<>();

	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();

	            String query = " select * ";
	            query += " from ( ";
	            query += "    select rownum rnum, quality_id, title, mgr, insti, revision";
	            query += "    from ( ";
	            query += "        select quality_id, title, mgr, insti,revision ";
	            query += "        from qualitystandards ";
	            query += "        order by quality_id ";
	            query += "    ) ";
	            query += " ) ";
	            query += " where rnum >= ? and rnum <= ?";

	            ps = con.prepareStatement(query);

	            ps.setInt(1, start);
	            ps.setInt(2, end);

	            rs = ps.executeQuery();

	            while (rs.next()) {
	                String quality_id = rs.getString("quality_id");
	                String title = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();

	                StandardDTO dto = new StandardDTO();
	                dto.setQuality_id(quality_id);
	                dto.setTitle(title);
	                dto.setMgr(mgr);
	                dto.setInsti(insti);
	                dto.setRevision(revision);

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

	    public int totalsstandardPage() {
	        int result = -1;

	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;

	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();

	            String query = "select count(*) cnt from QualityStandards";

	            ps = con.prepareStatement(query);

	            rs = ps.executeQuery();

	            if (rs.next()) {
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
	    public List selectStandard(String title) {
	        List list = new ArrayList();
	        
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query = "SELECT * FROM qualitystandards ";
	            
	            if(title != null && !(title.equals(""))) {
	                query += " where title= '" + title + "'";
	            }
	            
	            ps = con.prepareStatement(query);

	            rs = ps.executeQuery();

	            while(rs.next()) {
	            	String quality_id = rs.getString("quality_id");
	                String title1 = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();
	                
	                StandardDTO dto = new StandardDTO();
	                dto.setQuality_id(quality_id);
	                dto.setTitle(title);
	                dto.setMgr(mgr);
	                dto.setInsti(insti);
	                dto.setRevision(revision);

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
	    public List selectTit(String title) {
	        List list = new ArrayList();
	            
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        
	        try {
	            Context ctx = new InitialContext();
	            DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

	            con = dataSource.getConnection();
	            
	            String query = "SELECT * FROM qualitystandards WHERE title = ?";
	            
	            ps = con.prepareStatement(query);
	            
	            ps.setString(1, title);

	            rs = ps.executeQuery();
	            
	            while(rs.next()) {
	            	String quality_id = rs.getString("quality_id");
	                String title1 = rs.getString("title");
	                String mgr = rs.getString("mgr");
	                String insti = rs.getString("insti");
	                LocalDate revision = rs.getDate("revision").toLocalDate();
	                
	                StandardDTO dto = new StandardDTO();
	                dto.setQuality_id(quality_id);
	                dto.setTitle(title);
	                dto.setMgr(mgr);
	                dto.setInsti(insti);
	                dto.setRevision(revision);

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
}