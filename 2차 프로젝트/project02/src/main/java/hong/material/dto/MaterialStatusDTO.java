package hong.material.dto;

import java.sql.Date;

public class MaterialStatusDTO {
	private String prodnum;
	private String lotnum;
	private String prodname;
	private int tquantity;
	private String spec;
	private String storage_loc;
	private Date editdate;
	
	public String getProdnum() {
		return prodnum;
	}
	public void setProdnum(String prodnum) {
		this.prodnum = prodnum;
	}
	public String getLotnum() {
		return lotnum;
	}
	public void setLotnum(String lotnum) {
		this.lotnum = lotnum;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public int getTquantity() {
		return tquantity;
	}
	public void setTquantity(int tquantity) {
		this.tquantity = tquantity;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public String getStorage_loc() {
		return storage_loc;
	}
	public void setStorage_loc(String storage_loc) {
		this.storage_loc = storage_loc;
	}
	public Date getEditdate() {
		return editdate;
	}
	public void setEditdate(Date editdate) {
		this.editdate = editdate;
	}
	
}
