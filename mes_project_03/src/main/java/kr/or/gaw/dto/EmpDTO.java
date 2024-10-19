package kr.or.gaw.dto;


import java.sql.Date;


import org.springframework.stereotype.Component;
@Component
public class EmpDTO {
	
	private String user_id;
	private String name;
	private String user_name;
	private String email;
	private String phone;
	private String dept_id;
	private String dept_name;
	private String position;
	private Date hire_date;
	private String mgr;
	private String mgr_id;
	private String mgr_name;
	private String password;
	private int enabled;
	private Date birth_date;
	private int gender;
	private int nationality;
	private String masked_phone;
	private String masked_email;
	private String profile_url;
	
	
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getMgr_name() {
		return mgr_name;
	}
	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getMgr_id() {
		return mgr_id;
	}
	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}
	public String getMasked_phone() {
		return masked_phone;
	}
	public void setMasked_phone(String masked_phone) {
		this.masked_phone = masked_phone;
	}
	public String getMasked_email() {
		return masked_email;
	}
	public void setMasked_email(String masked_email) {
		this.masked_email = masked_email;
	}
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