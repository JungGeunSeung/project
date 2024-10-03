package hong.material.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hong.material.dto.MaterialStatusDTO;



public class MaterialStatusDAO {

	public List<MaterialStatusDTO> AllList() {
		List<MaterialStatusDTO> list = new ArrayList<MaterialStatusDTO>();

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			System.out.println("status 데이터베이스 접속 확인 2");
			query = " SELECT * FROM inventorystatus WHERE yn = 'Y' ";
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MaterialStatusDTO dto = new MaterialStatusDTO();
				dto.setProdnum(rs.getString("productnum"));
				dto.setLotnum(rs.getString("lotnum"));
				dto.setProdname(rs.getString("productname"));
				dto.setTquantity(rs.getInt("tquantity"));
				dto.setSpec(rs.getString("specification"));
				dto.setStorage_loc(rs.getString("storage_location"));
				dto.setEditdate(rs.getDate("editdate"));

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

	public MaterialStatusDTO getDTO(String str) {
		MaterialStatusDTO dto = new MaterialStatusDTO();
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			System.out.println("getdto 안의 str " + str );
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " SELECT * FROM inventorystatus WHERE productnum = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, str);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setProdnum(rs.getString("productnum"));
				dto.setLotnum(rs.getString("lotnum"));
				dto.setProdname(rs.getString("productname"));
				dto.setTquantity(rs.getInt("tquantity"));
				dto.setSpec(rs.getString("specification"));
				System.out.println("getdto의 위치 : " + rs.getString("storage_location"));
				dto.setStorage_loc(rs.getString("storage_location"));
				dto.setEditdate(rs.getDate("editdate"));
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateDTO(MaterialStatusDTO afterdto) {
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			afterdto.getStorage_loc();
			
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			
			query = " UPDATE inventorystatus set lotnum = ?, productname = ?, specification = ?"
					+ " , storage_location = ?, editdate = sysdate "
					+ " where productnum = ? ";//inventory 테이블 수정
			ps = con.prepareStatement(query);
			ps.setString(1, afterdto.getLotnum());
			ps.setString(2, afterdto.getProdname());
			ps.setString(3, afterdto.getSpec());
			System.out.println("update 할 때 : " + afterdto.getStorage_loc());
			ps.setString(4, afterdto.getStorage_loc());
			ps.setString(5, afterdto.getProdnum());
			int rs = ps.executeUpdate();

			ps.close();
			con.close();
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void adddto(MaterialStatusDTO dto) {
		try {
			System.out.println("adddto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			String prodnum = dto.getProdnum();
			String lotnum = dto.getLotnum();
			String prodname = dto.getProdname();
			String spec = dto.getSpec();
			String loc = dto.getStorage_loc();
			System.out.println("prodnum : " + prodnum);
			System.out.println("lotnum : " + lotnum);
			System.out.println("prodname : " + prodname);
			System.out.println("spec : " + spec);
			System.out.println("loc : " + loc);
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " insert into inventorystatus (productnum,lotnum,productname,tquantity,specification,storage_location) "
					+ " values(?,?,?,0,?,?) ";
			ps = con.prepareStatement(query);
			ps.setString(1, prodnum);
			ps.setString(2, lotnum);
			ps.setString(3, prodname);
			ps.setString(4, spec);
			ps.setString(5, loc);
			int rs = ps.executeUpdate();
			
			ps.close();
			con.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
	}
	public void deletedto(List<MaterialStatusDTO> dtolist) {
		try {
			System.out.println("deletedto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			for(MaterialStatusDTO dto : dtolist) {//삭제 할 행들 전부 삭제
				con=dataSource.getConnection();
				query = " update inventorystatus "
						+ " set yn = 'N' "
						+ " where productnum = ? ";
				ps = con.prepareStatement(query);
				System.out.println("dto.getprodnum() : " + dto.getProdnum());
				ps.setString(1, dto.getProdnum());
				int rs = ps.executeUpdate();
				ps.close();
				con.close();
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
