package kr.or.gaw.dto;

public class ProductDTO {

	private String prosduct_id;
	private String name;
	private String code;
	private String description;
	
	public String getProsduct_id() {
		return prosduct_id;
	}
	public void setProsduct_id(String prosduct_id) {
		this.prosduct_id = prosduct_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "ProductDTO [prosduct_id=" + prosduct_id + ", name=" + name + ", code=" + code + ", description="
				+ description + "]";
	}
	
}
