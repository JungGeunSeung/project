package kr.or.gaw.dto;

import java.sql.Date;

public class EquipmentDTO {

	private String equip_id;
	private String name;
	private String type;
	private String location;
	private String staus;
	private Date purchase;
	private Date last;
	
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStaus() {
		return staus;
	}
	public void setStaus(String staus) {
		this.staus = staus;
	}
	public Date getPurchase() {
		return purchase;
	}
	public void setPurchase(Date purchase) {
		this.purchase = purchase;
	}
	public Date getLast() {
		return last;
	}
	public void setLast(Date last) {
		this.last = last;
	}
	
	@Override
	public String toString() {
		return "EquipmentDTO [equip_id=" + equip_id + ", name=" + name + ", type=" + type + ", location=" + location
				+ ", staus=" + staus + ", purchase=" + purchase + ", last=" + last + "]";
	}
	
}
