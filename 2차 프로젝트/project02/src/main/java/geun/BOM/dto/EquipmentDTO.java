package geun.BOM.dto;

import java.sql.Date;

public class EquipmentDTO {
	private String equiID;
	private String equiname;
	private String equiImg;
	private String equiType;
	private String equiDesc;
	private Date sellDate;
	private String equiLoc;
	private String status;
	private String userid;
	private Date mainDate;
	
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
	public String getEquiImg() {
		return equiImg;
	}
	public void setEquiImg(String equiImg) {
		this.equiImg = equiImg;
	}
	public String getEquiType() {
		return equiType;
	}
	public void setEquiType(String equiType) {
		this.equiType = equiType;
	}
	public String getEquiDesc() {
		return equiDesc;
	}
	public void setEquiDesc(String equiDesc) {
		this.equiDesc = equiDesc;
	}
	public Date getSellDate() {
		return sellDate;
	}
	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}
	public String getEquiLoc() {
		return equiLoc;
	}
	public void setEquiLoc(String equiLoc) {
		this.equiLoc = equiLoc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getMainDate() {
		return mainDate;
	}
	public void setMainDate(Date mainDate) {
		this.mainDate = mainDate;
	}
	
	@Override
	public String toString() {
		return "EquipmentDTO [equiID=" + equiID + ", equiname=" + equiname + ", equiImg=" + equiImg + ", equiType="
				+ equiType + ", equiDesc=" + equiDesc + ", sellDate=" + sellDate + ", equiLoc=" + equiLoc + ", status="
				+ status + ", userid=" + userid + ", mainDate=" + mainDate + "]";
	}
	
	
	
	
}
