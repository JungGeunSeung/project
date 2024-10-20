package kr.or.gaw.dto;

import java.sql.Date;

public class WorkOrderDTO {

	private String order_id;
	private String plan_id;
	private String mgr_id;
	private String equiP_id;
	private Date start_date;
	private Date end_date;
	private String status;
	private int quantity;
	private int defect_quantity;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}
	public String getMgr_id() {
		return mgr_id;
	}
	public void setMgr_id(String mgr_id) {
		this.mgr_id = mgr_id;
	}
	public String getEquiP_id() {
		return equiP_id;
	}
	public void setEquiP_id(String equiP_id) {
		this.equiP_id = equiP_id;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getDefect_quantity() {
		return defect_quantity;
	}
	public void setDefect_quantity(int defect_quantity) {
		this.defect_quantity = defect_quantity;
	}
	
	@Override
	public String toString() {
		return "WorkOrderDTO [order_id=" + order_id + ", plan_id=" + plan_id + ", mgr_id=" + mgr_id + ", equiP_id="
				+ equiP_id + ", start_date=" + start_date + ", end_date=" + end_date + ", status=" + status
				+ ", quantity=" + quantity + ", defect_quantity=" + defect_quantity + "]";
	}
	
}
