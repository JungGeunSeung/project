package kr.or.gaw.dto;

import java.sql.Date;

public class PlanDTO {

	private String plan_id;
	private String product_id;
	private Date start_date;
	private Date end_date;
	private int quantity;
	private String created_by;
	private String status;
	private String emp_name;
	private String product_name;
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "PlanDTO [plan_id=" + plan_id + ", product_id=" + product_id + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", quantity=" + quantity + ", created_by=" + created_by + ", status="
				+ status + ", emp_name=" + emp_name + ", product_name=" + product_name
				+ "]";
	}
	
}
