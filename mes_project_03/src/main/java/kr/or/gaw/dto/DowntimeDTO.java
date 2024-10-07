package kr.or.gaw.dto;

import java.sql.Date;

public class DowntimeDTO {

	private String downtime_id;
	private String equip_id;
	private Date start_time;
	private Date end_time;
	private String reason;
	private String user_id;
	private String comments;
	
	public String getDowntime_id() {
		return downtime_id;
	}
	public void setDowntime_id(String downtime_id) {
		this.downtime_id = downtime_id;
	}
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "DowntimeDTO [downtime_id=" + downtime_id + ", equip_id=" + equip_id + ", start_time=" + start_time
				+ ", end_time=" + end_time + ", reason=" + reason + ", user_id=" + user_id + ", comments=" + comments
				+ "]";
	}
	
}
