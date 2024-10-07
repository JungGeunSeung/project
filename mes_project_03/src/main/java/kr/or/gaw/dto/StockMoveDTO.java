package kr.or.gaw.dto;

import java.sql.Date;

public class StockMoveDTO {

	private String move_id;
	private String product_id;
	private String type;
	private int quantity;
	private Date stock_date;
	private String user_id;
	
	public String getMove_id() {
		return move_id;
	}
	public void setMove_id(String move_id) {
		this.move_id = move_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(Date stock_date) {
		this.stock_date = stock_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "StockMoveDTO [move_id=" + move_id + ", product_id=" + product_id + ", type=" + type + ", quantity="
				+ quantity + ", stock_date=" + stock_date + ", user_id=" + user_id + "]";
	}
	
}
