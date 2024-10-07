package kr.or.gaw.dto;

import java.sql.Date;

public class MaterialMoveDTO {

	private String move_id;
	private String material_id;
	private String user_id;
	private String from_location;
	private String to_location;
	private int quantity;
	private String move_type;
	private Date move_date;
	
	public String getMove_id() {
		return move_id;
	}
	public void setMove_id(String move_id) {
		this.move_id = move_id;
	}
	public String getMaterial_id() {
		return material_id;
	}
	public void setMaterial_id(String material_id) {
		this.material_id = material_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFrom_location() {
		return from_location;
	}
	public void setFrom_location(String from_location) {
		this.from_location = from_location;
	}
	public String getTo_location() {
		return to_location;
	}
	public void setTo_location(String to_location) {
		this.to_location = to_location;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getMove_type() {
		return move_type;
	}
	public void setMove_type(String move_type) {
		this.move_type = move_type;
	}
	public Date getMove_date() {
		return move_date;
	}
	public void setMove_date(Date move_date) {
		this.move_date = move_date;
	}
	
	@Override
	public String toString() {
		return "MaterialMoveDTO [move_id=" + move_id + ", material_id=" + material_id + ", user_id=" + user_id
				+ ", from_location=" + from_location + ", to_location=" + to_location + ", quantity=" + quantity
				+ ", move_type=" + move_type + ", move_date=" + move_date + "]";
	}
	
}
