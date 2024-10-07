package kr.or.gaw.dto;

import java.sql.Date;

public class DefectDTO {

	private String defect_id;
	private String product_id;
	private String detected_by;
	private String defect_type;
	private String description;
	private Date defect_date;
	private String corrective;
	
	public String getDefect_id() {
		return defect_id;
	}
	public void setDefect_id(String defect_id) {
		this.defect_id = defect_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getDetected_by() {
		return detected_by;
	}
	public void setDetected_by(String detected_by) {
		this.detected_by = detected_by;
	}
	public String getDefect_type() {
		return defect_type;
	}
	public void setDefect_type(String defect_type) {
		this.defect_type = defect_type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDefect_date() {
		return defect_date;
	}
	public void setDefect_date(Date defect_date) {
		this.defect_date = defect_date;
	}
	public String getCorrective() {
		return corrective;
	}
	public void setCorrective(String corrective) {
		this.corrective = corrective;
	}
	
	@Override
	public String toString() {
		return "DefectDTO [defect_id=" + defect_id + ", product_id=" + product_id + ", detected_by=" + detected_by
				+ ", defect_type=" + defect_type + ", description=" + description + ", defect_date=" + defect_date
				+ ", corrective=" + corrective + "]";
	}
}
