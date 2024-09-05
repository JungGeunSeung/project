package hong.material.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hong.material.dto.UserDTO;

public class UserDAO {

	public UserDTO findUserById(String id) {
		UserDTO dto = new UserDTO();
		try {
			
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " SELECT * FROM usertable WHERE userid = ? ";
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString("userid"));
				dto.setUserid(rs.getString("userid"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phonenumber"));
				dto.setBirth(rs.getDate("birth_date"));
				dto.setHire(rs.getDate("hiredate"));
				dto.setGrade(rs.getString("grade"));
				dto.setEmpno(rs.getInt("empno"));
				//dto.setDeptno(rs.getInt("deptno"));
				dto.setPw(rs.getString("pw"));
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return dto;
	}
}
