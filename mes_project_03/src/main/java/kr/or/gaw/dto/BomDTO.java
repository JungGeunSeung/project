package kr.or.gaw.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class BomDTO {

	private String bom_id;
	private String product_id;
	private String material_id;
	private String material_name;
	private int quantity;
	private String version;
	private Date create_at;
	private int countperpage;
	private int page;
	private int bom_count;
	private int total_quantity;
	private String name;
	private String standard;
	private String color;
	private int count;
	private String BomDetail;
	
	
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
	public int getCountperpage() {
		return countperpage;
	}
	public void setCountperpage(int countperpage) {
		this.countperpage = countperpage;
	}
	public int getBom_count() {
		return bom_count;
	}
	public void setBom_count(int bom_count) {
		this.bom_count = bom_count;
	}
	public int getTotal_quantity() {
		return total_quantity;
	}
	public void setTotal_quantity(int total_quantity) {
		this.total_quantity = total_quantity;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBomDetail() {
		return BomDetail;
	}
	public void setBomDetail(String bomDetail) {
		BomDetail = bomDetail;
	}
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}


}
