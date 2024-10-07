package kr.or.gaw.dto;

import java.sql.Date;

public class SalesOrderDTO {

	private String order_id;
	private String client_id;
	private Date order_date;
	private String status;
	private int toral;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getToral() {
		return toral;
	}
	public void setToral(int toral) {
		this.toral = toral;
	}
	
	@Override
	public String toString() {
		return "SalesOrderDTO [order_id=" + order_id + ", client_id=" + client_id + ", order_date=" + order_date
				+ ", status=" + status + ", toral=" + toral + "]";
	}
}
