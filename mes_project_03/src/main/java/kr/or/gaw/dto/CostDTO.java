package kr.or.gaw.dto;

import java.sql.Date;

public class CostDTO {

	private String cost_id;
	private String product_id;
	private int matetrial_cost;
	private int labor_cost;
	private int over_cost;
	private int total;
	private Date create_at;
	
	public String getCost_id() {
		return cost_id;
	}
	public void setCost_id(String cost_id) {
		this.cost_id = cost_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getMatetrial_cost() {
		return matetrial_cost;
	}
	public void setMatetrial_cost(int matetrial_cost) {
		this.matetrial_cost = matetrial_cost;
	}
	public int getLabor_cost() {
		return labor_cost;
	}
	public void setLabor_cost(int labor_cost) {
		this.labor_cost = labor_cost;
	}
	public int getOver_cost() {
		return over_cost;
	}
	public void setOver_cost(int over_cost) {
		this.over_cost = over_cost;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	
	@Override
	public String toString() {
		return "CostDTO [cost_id=" + cost_id + ", product_id=" + product_id + ", matetrial_cost=" + matetrial_cost
				+ ", labor_cost=" + labor_cost + ", over_cost=" + over_cost + ", total=" + total + ", create_at="
				+ create_at + "]";
	}
	
}
