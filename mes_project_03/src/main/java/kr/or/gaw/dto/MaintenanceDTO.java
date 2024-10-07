package kr.or.gaw.dto;

import java.sql.Date;

public class MaintenanceDTO {

	private String main_id;
	private String equip_id;
	private Date main_date;
	private String performed_by;
	private String description;
	
	public String getMain_id() {
		return main_id;
	}
	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}
	public Date getMain_date() {
		return main_date;
	}
	public void setMain_date(Date main_date) {
		this.main_date = main_date;
	}
	public String getPerformed_by() {
		return performed_by;
	}
	public void setPerformed_by(String performed_by) {
		this.performed_by = performed_by;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "MaintenanceDTO [main_id=" + main_id + ", equip_id=" + equip_id + ", main_date=" + main_date
				+ ", performed_by=" + performed_by + ", description=" + description + "]";
	}
	
}
