package hong.material.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import hong.material.dto.MaterialDTO;



public class MaterialDAO {

	public List AllList() {
		List list = new ArrayList();

		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			System.out.println("데이터베이스 접속 확인 2");
			query = " SELECT * FROM inventory WHERE yn = 'Y' order by inum desc ";
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MaterialDTO materialDTO = new MaterialDTO();
				materialDTO.setnum(rs.getInt("inum"));
				materialDTO.setprodNum(rs.getString("productnum"));
				materialDTO.setLOTNum(rs.getString("lotnum"));
				materialDTO.setprodName(rs.getString("productname"));
				materialDTO.setInout(rs.getString("inout"));
				materialDTO.setCnt(rs.getInt("quantity"));
				Date datestr = rs.getDate("inspectdate");
				materialDTO.setDate(datestr);
				materialDTO.setChecker(rs.getString("inspector"));

				list.add(materialDTO);
			}

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return list;
	}

	public MaterialDTO getDTO(int num) {
		MaterialDTO dto = new MaterialDTO();
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " SELECT * FROM inventory WHERE inum = ?";
			ps = con.prepareStatement(query);
			if (num != 0) {
				ps.setInt(1, num);
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				dto.setnum(rs.getInt("inum"));
				dto.setprodNum(rs.getString("productnum"));
				dto.setLOTNum(rs.getString("lotnum"));
				dto.setprodName(rs.getString("productname"));
				dto.setInout(rs.getString("inout"));
				dto.setCnt(rs.getInt("quantity"));
				Date datestr = rs.getDate("inspectdate");
				dto.setDate(datestr);
				dto.setChecker(rs.getString("inspector"));

			}

			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
	}

	public void updateDTO(MaterialDTO afterdto) {
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			MaterialDTO beforedto = new MaterialDTO();
			int inum = afterdto.getnum();//수정될 행의 번호
			beforedto = getDTO(inum);//수정될 행의 번호로 수정할 행의 dto 가져오기

			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			String inout1 = beforedto.getInout();//수정될 행의 입/출고 확인
			System.out.println(inout1);
			String inout2 = afterdto.getInout();//수정할 행의 입/출고 확인
			System.out.println(inout2);
			query = " UPDATE inventory set productnum = ?, lotnum = ?, productname = ?, inout = ?"
					+ ", inspector = ?, quantity = ?, inspectdate = ?"
					+ "where inum = ?";//inventory 테이블 수정
			ps = con.prepareStatement(query);
			ps.setString(1, afterdto.getprodNum());
			ps.setString(2, afterdto.getLOTNum());
			ps.setString(3, afterdto.getprodName());
			ps.setString(4, afterdto.getInout());
			ps.setString(5, afterdto.getChecker());
			ps.setInt(6, afterdto.getCnt());
			ps.setDate(7, afterdto.getDate());
			ps.setInt(8, inum);
			int rs = ps.executeUpdate();

			ps.close();
			con.close();
			

			if ("IN".equals(inout1)) {
				// inventorystatus의beforedto의 productnum을 사용해 갯수 빼기
				System.out.println("바뀌기전 : in");
				edit_deletedto(beforedto);
				if ("IN".equals(inout2)) {
					// afterdto를 사용해 갯수 더하기
					System.out.println("바뀌기 후 : in");
					edit_adddto(afterdto);
				} else {
					// afterdto를 사용해 갯수 빼기
					System.out.println("바뀌기 후 : out");
					edit_deletedto(afterdto);
				}
			} 
			else {
				// inventorystatus의beforedto의 productnum을 사용해 갯수 더하기

				System.out.println("바뀌기전 : out");
				edit_adddto(beforedto);
				if ("IN".equals(inout2)) {
					// afterdto를 사용해 갯수 더하기
					System.out.println("바뀌기 후 : in");
					edit_adddto(afterdto);
				} else {
					// afterdto를 사용해 갯수 빼기
					System.out.println("바뀌기 후 : out");
					edit_deletedto(afterdto);
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void edit_adddto(MaterialDTO dto) {
		try {
			System.out.println("edit_adddto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			int cnt = dto.getCnt();//추가될 갯수
			int totalcnt=0;
			String prodnum = dto.getprodNum();//수정될 제품번호
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = "select tquantity from inventorystatus where productnum = ?";//inventorystatus의 갯수를 가져오기 위한 코드
			ps = con.prepareStatement(query);
			ps.setString(1, prodnum);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				totalcnt = rs.getInt("tquantity");
			}
			System.out.println("원래 있던 갯수 : " + totalcnt);
			totalcnt=totalcnt+cnt;
			ps.close();
			con.close();
			
			
			////////////////////////////////////////inventorystatus 업데이트
			con = dataSource.getConnection();
			query = " update inventorystatus "
					+ " set tquantity = ? ,editdate = ? "
					+ " where productnum = ? ";
			ps = con.prepareStatement(query);
			ps.setInt(1, totalcnt);//더해진 갯수
			ps.setDate(2, Date.valueOf(LocalDate.now()));//더해진 갯수
			ps.setString(3, prodnum);//
			int rs1 = ps.executeUpdate();

			System.out.println("추가된 totalcnt : " +totalcnt);
			
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void edit_deletedto(MaterialDTO dto) {
		try {
			System.out.println("edit_deletedto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			int cnt = dto.getCnt();
			int totalcnt = 0;
			String prodnum = dto.getprodNum();
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = "select tquantity from inventorystatus where productnum = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, prodnum);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				totalcnt = rs.getInt("tquantity");
			}
			
			System.out.println("cnt : " +cnt);
			totalcnt=totalcnt-cnt;
			System.out.println("totalcnt : " +totalcnt);
			System.out.println("productnum : " + prodnum);
			ps.close();
			con.close();
			
			////////////////////////////////////////inventorystatus 업데이트
			con = dataSource.getConnection();
			query = " update inventorystatus "
					+ " set tquantity = ? ,editdate = ? "
					+ " where productnum = ? ";
			ps = con.prepareStatement(query);
			ps.setInt(1, totalcnt);//더해진 갯수
			ps.setDate(2, Date.valueOf(LocalDate.now()));//더해진 갯수
			ps.setString(3, prodnum);//
			int rs1 = ps.executeUpdate();

			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void adddto(MaterialDTO dto) {
		try {
			System.out.println("adddto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

			String prodnum = dto.getprodNum();
			System.out.println("바뀔 생산 번호 : " + prodnum);
			String lotnum = dto.getLOTNum();
			String prodname = dto.getprodName();
			String inout = dto.getInout();
			int cnt = dto.getCnt();
			Date date = dto.getDate();
			String inspector = dto.getChecker();
			
			int totalcnt = 0;
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			query = " insert into inventory (inum,productnum,lotnum,productname,inout,inspector,quantity,inspectdate) "
					+ " values(inum_seq.NEXTVAL,?,?,?,?,?,?,?) ";
			ps = con.prepareStatement(query);
			ps.setString(1, prodnum);
			ps.setString(2, lotnum);
			ps.setString(3, prodname);
			ps.setString(4, inout);
			ps.setString(5, inspector);
			ps.setInt(6, cnt);
			ps.setDate(7, date);
			int rs = ps.executeUpdate();
			
			ps.close();
			con.close();
			
			////////////////////////////////////////inventorystatus tquantity 가져오기
			
			if ("IN".equals(inout)) {
				edit_adddto(dto);
				
			} 
			else {
				// inventorystatus의beforedto의 productnum을 사용해 갯수 더하기
				edit_deletedto(dto);
				
			}

			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void deletedto(List<MaterialDTO> dtolist) {
		try {
			System.out.println("adddto 실행");
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");
			
			int totalcnt = 0;
			// 커넥션 풀에서 접속 정보를 가져오기
			Connection con = dataSource.getConnection();
			String query = null;
			PreparedStatement ps = null;
			for(MaterialDTO dto : dtolist) {//삭제 할 행들 전부 삭제
				con=dataSource.getConnection();
				query = " update inventory set yn = 'N'  where inum = ? ";
				ps = con.prepareStatement(query);
				System.out.println("삭제할 행 번호 : " + dto.getnum());
				ps.setInt(1, dto.getnum());
				int rs = ps.executeUpdate();
				ps.close();
				con.close();
			}
			
			
			////////////////////////////////////////inventorystatus tquantity 가져오기
			
			for(MaterialDTO dto : dtolist) {
				if("IN".equals(dto.getInout())) {
					edit_deletedto(dto);
				}
				else {
					edit_adddto(dto);
				}
			}

			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
