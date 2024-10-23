package kr.or.gaw.dto;

import java.sql.Date;

public class WorkOrderDTO {

	private String order_id;
	private String plan_id;
	private String mgr_id;
	private String equip_id;
	private Date start_date;
	private Date end_date;
	private String status;
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}

	private int quantity;
	private int defect_quantity;
	private String emp_name;
	private String equipment_name;
	
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEquipment_name() {
		return equipment_name;
	}
	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}
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
		return "WorkOrderDTO [order_id=" + order_id + ", plan_id=" + plan_id + ", mgr_id=" + mgr_id + ", equip_id="
				+ equip_id + ", start_date=" + start_date + ", end_date=" + end_date + ", status=" + status
				+ ", quantity=" + quantity + ", defect_quantity=" + defect_quantity + ", emp_name=" + emp_name
				+ ", equipment_name=" + equipment_name + "]";
	}
	
}
