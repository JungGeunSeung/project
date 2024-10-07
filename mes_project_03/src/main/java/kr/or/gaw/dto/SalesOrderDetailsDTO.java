package kr.or.gaw.dto;

public class SalesOrderDetailsDTO {

	private String detail_id;
	private String order_id;
	private String product_id;
	private int quantity;
	private int price;
	private int subtotal;
	
	public String getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(String detail_id) {
		this.detail_id = detail_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
	
	@Override
	public String toString() {
		return "SalesOrderDetailsDTO [detail_id=" + detail_id + ", order_id=" + order_id + ", product_id=" + product_id
				+ ", quantity=" + quantity + ", price=" + price + ", subtotal=" + subtotal + "]";
	}
	
}
