package kr.or.gaw.dto;

public class ProductDTO {

	private String prosduct_id;
	private String name;
	private String standard;
	private String color;
	
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
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "ProductDTO [prosduct_id=" + prosduct_id + ", name=" + name + ", standard=" + standard + ", color="
				+ color + "]";
	}

}
