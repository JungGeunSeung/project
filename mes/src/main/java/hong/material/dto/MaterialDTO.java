package hong.material.dto;

import java.sql.Date;

public class MaterialDTO {

	int num;
	String prodNum;
	String LOTNum;
	String prodName;
	String inout;
	int cnt;
	Date date;
	String checker;
	
	public int getnum() {
		return num;
	}
	
	public void setnum(int num) {
		this.num=num;
	}
	
	
	public String getprodNum() {
		return prodNum;
	}
	public void setprodNum(String prodNum) {
		this.prodNum = prodNum;
	}
	public String getLOTNum() {
		return LOTNum;
	}
	public void setLOTNum(String lOTNum) {
		LOTNum = lOTNum;
	}
	public String getprodName() {
		return prodName;
	}
	public void setprodName(String prodName) {
		this.prodName = prodName;
	}
	public String getInout() {
		return inout;
	}
	public void setInout(String inout) {
		this.inout = inout;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	
	
}
