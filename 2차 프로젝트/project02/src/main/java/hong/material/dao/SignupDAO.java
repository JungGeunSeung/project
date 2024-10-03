package hong.material.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hong.material.dto.SignupDTO;

public class SignupDAO {

	public void signup(SignupDTO dto) {
		
		
		try {
			System.out.println("dao 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			String id = dto.getId();
			String name = dto.getName();
			String pw = dto.getPw();
			String email = dto.getEmail();
			String phone = dto.getPhonenum();
			Date birth = dto.getBirth();
			
			String query = null;
			Connection con = dataSource.getConnection();
			PreparedStatement ps = null;
			query = " insert into usertable (userid, name, email, phonenumber,birth_date,pw,empno) "
					+ " values(?,?,?,?,?,?,emp_seq.NEXTVAL) ";
			ps=con.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setDate(5, birth);
			ps.setString(6, pw);
			
			int rs = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
}
