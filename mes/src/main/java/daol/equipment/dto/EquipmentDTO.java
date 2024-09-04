package daol.equipment.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EquipmentDTO {
	private String equiID;
	private String equiname;
	private String equitype;
	private String equiloc; // 새로운 속성 추가
	private Date selldate;
	private String status;
	private String manager;
	private Date maindate;
	private String maincontent;

	

	// Getters and Setters

	public String getEquiID() {
		return equiID;
	}

	public void setEquiID(String equiID) {
		this.equiID = equiID;
	}

	public String getEquiname() {
		return equiname;
	}

	public void setEquiname(String equiname) {
		this.equiname = equiname;
	}

	public String getEquitype() {
		return equitype;
	}

	public void setEquitype(String equitype) {
		this.equitype = equitype;
	}
	
	public String getEquiloc() {
		return equiloc;
	}
	
	public void setEquiloc(String equiloc) {
		this.equiloc = equiloc;
	}

	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public Date getMaindate() {
		return maindate;
	}

	public void setMaindate(Date maindate) {
		this.maindate = maindate;
	}

	public String getMaincontent() {
		return maincontent;
	}

	public void setMaincontent(String maincontent) {
		this.maincontent = maincontent;
	}

	public Date getSelldate() {
		return selldate;
	}

	public void setSelldate(Date selldate) {
		this.selldate = selldate;
		
	}




}
