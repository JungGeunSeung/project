package kr.or.gaw.dto;

import java.sql.Date;

public class RequestDTO {

	private String request_id;
	private String material_id;
	private String request_by;
	private Date req_date;
	private int quantity;
	private String status;
	private String material_name;
	public String getMaterial_name() {
		return material_name;
	}
	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}
	private int totalCount; // 전체 항목 수
	private int Page; // 현재 페이지
	private int countperpage; // 페이지당 항목 수
	private int totalPage; // 전체 페이지 수
	private int offset; // SQL 쿼리의 OFFSET
	
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getMaterial_id() {
		return material_id;
	}
	public void setMaterial_id(String material_id) {
		this.material_id = material_id;
	}
	public String getRequest_by() {
		return request_by;
	}
	public void setRequest_by(String request_by) {
		this.request_by = request_by;
	}
	public Date getReq_date() {
		return req_date;
	}
	public void setReq_date(Date req_date) {
		this.req_date = req_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
		return "RequestDTO [request_id=" + request_id + ", material_id=" + material_id + ", request_by=" + request_by
				+ ", req_date=" + req_date + ", quantity=" + quantity + ", status=" + status + ", totalCount="
				+ totalCount + ", Page=" + Page + ", countperpage=" + countperpage + ", totalPage=" + totalPage
				+ ", offset=" + offset + "]";
	}
	
	
		}
