package kr.or.gaw.dto;

import java.sql.Date;

public class RequestDTO {

	private String request_id;
	private String material_id;
	private String request_by;
	private Date req_date;
	private int quatity;
	private String status;
	
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getMaterial_id() {
		return material_id;
	}
	public void setMaterial_id(String material_id) {
		this.material_id = material_id;
	}
	public String getRequest_by() {
		return request_by;
	}
	public void setRequest_by(String request_by) {
		this.request_by = request_by;
	}
	public Date getReq_date() {
		return req_date;
	}
	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "RequestDTO [request_id=" + request_id + ", material_id=" + material_id + ", request_by=" + request_by
				+ ", req_date=" + req_date + ", quatity=" + quatity + ", status=" + status + "]";
	}
	
}
