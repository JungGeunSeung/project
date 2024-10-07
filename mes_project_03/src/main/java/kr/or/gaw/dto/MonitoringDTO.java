package kr.or.gaw.dto;

import java.sql.Date;

public class MonitoringDTO {

	private String monitoring_id;
	private String equip_id;
	private String status;
	private Date check_date;
	private String comments;
	
	public String getMonitoring_id() {
		return monitoring_id;
	}
	public void setMonitoring_id(String monitoring_id) {
		this.monitoring_id = monitoring_id;
	}
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCheck_date() {
		return check_date;
	}
	public void setCheck_date(Date check_date) {
		this.check_date = check_date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "MonitoringDTO [monitoring_id=" + monitoring_id + ", equip_id=" + equip_id + ", status=" + status
				+ ", check_date=" + check_date + ", comments=" + comments + "]";
	}
	
}
