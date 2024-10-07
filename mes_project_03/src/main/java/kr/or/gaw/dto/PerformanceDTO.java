package kr.or.gaw.dto;

import java.sql.Date;

public class PerformanceDTO {

	private String per_id;
	private String order_id;
	private int actusal;
	private int defect_quantity;
	private Date production_date;
	
	public String getPer_id() {
		return per_id;
	}
	public void setPer_id(String per_id) {
		this.per_id = per_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getActusal() {
		return actusal;
	}
	public void setActusal(int actusal) {
		this.actusal = actusal;
	}
	public int getDefect_quantity() {
		return defect_quantity;
	}
	public void setDefect_quantity(int defect_quantity) {
		this.defect_quantity = defect_quantity;
	}
	public Date getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}
	
	@Override
	public String toString() {
		return "PerformanceDTO [per_id=" + per_id + ", order_id=" + order_id + ", actusal=" + actusal
				+ ", defect_quantity=" + defect_quantity + ", production_date=" + production_date + "]";
	}
	
}
