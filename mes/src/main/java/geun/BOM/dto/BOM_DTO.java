package geun.BOM.dto;

public class BOM_DTO {
	
	private String bom_id;
	private String production_id;
	private String mid;
	private int bom_quantity;
	
	public String getBom_id() {
		return bom_id;
	}
	public void setBom_id(String bom_id) {
		this.bom_id = bom_id;
	}
	public String getProduction_id() {
		return production_id;
	}
	public void setProduction_id(String production_id) {
		this.production_id = production_id;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBom_quantity() {
		return bom_quantity;
	}
	public void setBom_quantity(int bom_quantity) {
		this.bom_quantity = bom_quantity;
	}
	
	@Override
	public String toString() {
		return "BOM_DTO [bom_id=" + bom_id + ", production_id=" + production_id + ", mid=" + mid + ", bom_quantity="
				+ bom_quantity + "]";
	}
	
}
