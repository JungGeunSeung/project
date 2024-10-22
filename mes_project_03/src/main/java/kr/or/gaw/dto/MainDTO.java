package kr.or.gaw.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MainDTO {
	private String product_id;
	private String product_name;
	private int total_actual;
	private int quantity;
	private int total_defect_quantity;
	private String defect_rate;
	private String status;
	private Date start_date;
	private String motion;
	private String nomal;
	private String drawers3;
	private String drawers4;
	private String drawers5;
	
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getTotal_actual() {
		return total_actual;
	}
	public void setTotal_actual(int total_actual) {
		this.total_actual = total_actual;
	}
	public int getTotal_defect_quantity() {
		return total_defect_quantity;
	}
	public void setTotal_defect_quantity(int total_defect_quantity) {
		this.total_defect_quantity = total_defect_quantity;
	}
	public String getDefect_rate() {
		return defect_rate;
	}
	public void setDefect_rate(String defect_rate) {
		this.defect_rate = defect_rate;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getMotion() {
		return motion;
	}
	public void setMotion(String motion) {
		this.motion = motion;
	}
	public String getNomal() {
		return nomal;
	}
	public void setNomal(String nomal) {
		this.nomal = nomal;
	}
	public String getDrawers3() {
		return drawers3;
	}
	public void setDrawers3(String drawers3) {
		this.drawers3 = drawers3;
	}
	public String getDrawers4() {
		return drawers4;
	}
	public void setDrawers4(String drawers4) {
		this.drawers4 = drawers4;
	}
	public String getDrawers5() {
		return drawers5;
	}
	public void setDrawers5(String drawers5) {
		this.drawers5 = drawers5;
	}


	
}
