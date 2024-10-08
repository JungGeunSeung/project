package kr.or.gaw.dto;


import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class EmpDTO {
	
	private String user_id;
	private String name;
	private String email;
	private String phone;
	private String dept_id;
	private String position;
	private Date hire_date;
	private String mgr;
	private String password;
	private int enabled;
	private Date birth_date;
	private int gender;
	private int nationality;
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public Date getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getNationality() {
		return nationality;
	}
	public void setNationality(int nationality) {
		this.nationality = nationality;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getMgr() {
		return mgr;
	}
	public void setMgr(String mgr) {
		this.mgr = mgr;
	}
	
	@Override
	public String toString() {
		return "EmpDTO [user_id=" + user_id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", dept_id="
				+ dept_id + ", position=" + position + ", hire_date=" + hire_date + ", mgr=" + mgr + ", password="
				+ password + ", enabled=" + enabled + ", birth_date=" + birth_date + ", gender=" + gender
				+ ", nationality=" + nationality + "]";
	}
	
	
}