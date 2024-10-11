package kr.or.gaw.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class BomDTO {

	private String bom_id;
	private String product_id;
	private String material_id;
	private int quantity;
	private String version;
	private Date create_at;
	
	public String getBom_id() {
		return bom_id;
	}
	public void setBom_id(String bom_id) {
		this.bom_id = bom_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMaterial_id() {
		return material_id;
	}
	public void setMaterial_id(String material_id) {
		this.material_id = material_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	
	@Override
	public String toString() {
		return "BomDTO [bom_id=" + bom_id + ", product_id=" + product_id + ", material_id=" + material_id
				+ ", quantity=" + quantity + ", version=" + version + ", create_at=" + create_at + "]";
	}
	
}
