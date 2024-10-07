package kr.or.gaw.dto;

import java.sql.Date;

public class InspectionDTO {

	private String ins_id;
	private String product_id;
	private String inspec_type;
	private String inspector_id;
	private Date quality_date;
	private String result;
	private String comments;
	
	public String getIns_id() {
		return ins_id;
	}
	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getInspec_type() {
		return inspec_type;
	}
	public void setInspec_type(String inspec_type) {
		this.inspec_type = inspec_type;
	}
	public String getInspector_id() {
		return inspector_id;
	}
	public void setInspector_id(String inspector_id) {
		this.inspector_id = inspector_id;
	}
	public Date getQuality_date() {
		return quality_date;
	}
	public void setQuality_date(Date quality_date) {
		this.quality_date = quality_date;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@Override
	public String toString() {
		return "InspectionDTO [ins_id=" + ins_id + ", product_id=" + product_id + ", inspec_type=" + inspec_type
				+ ", inspector_id=" + inspector_id + ", quality_date=" + quality_date + ", result=" + result
				+ ", comments=" + comments + "]";
	}
	
}
