package kr.or.gaw.dto;

import java.sql.Date;

public class StandardDTO {

	private String standard_id;
	private String criteria;
	private String value;
	private String tolerance;
	private String unit;
	private Date effective_date;
	private Date expiration_date;
	private String notice;
	private String product_id;
	
	public String getStandard_id() {
		return standard_id;
	}
	public void setStandard_id(String standard_id) {
		this.standard_id = standard_id;
	}
	public String getCriteria() {
		return criteria;
	}
	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getTolerance() {
		return tolerance;
	}
	public void setTolerance(String tolerance) {
		this.tolerance = tolerance;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Date getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}
	public Date getExpiration_date() {
		return expiration_date;
	}
	public void setExpiration_date(Date expiration_date) {
		this.expiration_date = expiration_date;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	
	@Override
	public String toString() {
		return "StandardDTO [standard_id=" + standard_id + ", criteria=" + criteria + ", value=" + value
				+ ", tolerance=" + tolerance + ", unit=" + unit + ", effective_date=" + effective_date
				+ ", expiration_date=" + expiration_date + ", notice=" + notice + ", product_id=" + product_id + "]";
	}
	
}
