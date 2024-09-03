package daol.equipment.dto;

import java.util.Date;

public class EquipmentDTO {
	private String equiID;
	private String equiname;
	private String equitype;
	private String manager;
	private Date maindate;
	private String maincontent;
	private String equiloc; // 새로운 속성 추가
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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

	public String getEquiloc() { // 새로운 getter 메서드
		return equiloc;
	}

	public void setEquiloc(String equiloc) { // 새로운 setter 메서드
		this.equiloc = equiloc;
	}



}
