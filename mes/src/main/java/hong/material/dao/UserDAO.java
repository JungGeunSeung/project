package hong.material.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hong.material.dto.MaterialDTO;
import hong.material.dto.MaterialStatusDTO;
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
	
	public List<UserDTO> AllList() {
		List<UserDTO> list = new ArrayList<UserDTO>();

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " SELECT * FROM usertable ";
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUserid(rs.getString("userid"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phonenumber"));
				dto.setBirth(rs.getDate("birth_date"));
				dto.setHire(rs.getDate("hiredate"));
				dto.setGrade(rs.getString("grade"));
				dto.setStatus(rs.getString("status"));
				dto.setEmpno(rs.getInt("empno"));
				dto.setDeptno(rs.getInt("deptno"));
				
				
				list.add(dto);
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return list;
	}
	
	public UserDTO getDTO(String str) {
		UserDTO dto = new UserDTO();
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			System.out.println("getdto 안의 str " + str );
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " SELECT * FROM usertable WHERE userid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, str);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setUserid(rs.getString("userid"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phonenumber"));
				dto.setBirth(rs.getDate("birth_date"));
				dto.setHire(rs.getDate("hiredate"));
				dto.setGrade(rs.getString("grade"));
				dto.setStatus(rs.getString("status"));
				dto.setEmpno(rs.getInt("empno"));
				dto.setDeptno(rs.getInt("deptno"));
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateDTO(UserDTO dto) {
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			
			query = " UPDATE usertable set name = ?, email = ?, phonenumber = ?"
					+ " , birth_date = ?, hiredate = ?, grade = ?, status = ?, empno = ?, deptno = ? "
					+ " where userid = ? ";//
			ps = con.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPhone());
			ps.setDate(4, dto.getBirth());
			ps.setDate(5, dto.getHire());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getStatus());
			ps.setInt(8, dto.getEmpno());
			ps.setInt(9, dto.getDeptno());
			ps.setString(10, dto.getUserid());
			int rs = ps.executeUpdate();

			ps.close();
			con.close();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
