package kr.or.gaw.dto;

import java.sql.Date;

public class CostDTO {

    private String cost_id;
    private String product_id;
    private int material_cost;
    private int labor_cost;
    private int over_cost;
    private int total;
    private Date create_at;
    private String payment_status;  // 입금 상태 추가
	private int totalCount; // 전체 항목 수
	private int Page; // 현재 페이지
	private int countperpage; // 페이지당 항목 수
	private int totalPage; // 전체 페이지 수
	private int offset; // SQL 쿼리의 OFFSET
	public String getCost_id() {
		return cost_id;
	}
	public void setCost_id(String cost_id) {
		this.cost_id = cost_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getmaterial_cost() {
		return material_cost;
	}
	public void setmaterial_cost(int material_cost) {
		this.material_cost = material_cost;
	}
	public int getLabor_cost() {
		return labor_cost;
	}
	public void setLabor_cost(int labor_cost) {
		this.labor_cost = labor_cost;
	}
	public int getOver_cost() {
		return over_cost;
	}
	public void setOver_cost(int over_cost) {
		this.over_cost = over_cost;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPage() {
		return Page;
	}
	public void setPage(int page) {
		Page = page;
	}
	public int getCountperpage() {
		return countperpage;
	}
	public void setCountperpage(int countperpage) {
		this.countperpage = countperpage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	@Override
	public String toString() {
		return "CostDTO [cost_id=" + cost_id + ", product_id=" + product_id + ", material_cost=" + material_cost
				+ ", labor_cost=" + labor_cost + ", over_cost=" + over_cost + ", total=" + total + ", create_at="
				+ create_at + ", payment_status=" + payment_status + ", totalCount=" + totalCount + ", Page=" + Page
				+ ", countperpage=" + countperpage + ", totalPage=" + totalPage + ", offset=" + offset + "]";
	}

   
}
