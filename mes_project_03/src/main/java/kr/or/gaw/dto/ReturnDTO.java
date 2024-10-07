package kr.or.gaw.dto;

import java.sql.Date;

public class ReturnDTO {

	private String return_id;
	private String product_id;
	private String reason;
	private Date request_date;
	private String approved_by;
	private Date approved_date;
	private String status;
	
	public String getReturn_id() {
		return return_id;
	}
	public void setReturn_id(String return_id) {
		this.return_id = return_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public String getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}
	public Date getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(Date approved_date) {
		this.approved_date = approved_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "ReturnDTO [return_id=" + return_id + ", product_id=" + product_id + ", reason=" + reason
				+ ", request_date=" + request_date + ", approved_by=" + approved_by + ", approved_date=" + approved_date
				+ ", status=" + status + "]";
	}
	
}
