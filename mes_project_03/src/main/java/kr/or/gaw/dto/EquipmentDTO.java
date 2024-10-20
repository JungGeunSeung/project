package kr.or.gaw.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class EquipmentDTO {

	private String equip_id;
	private String name;
	private String type;
	private String location;
	private String status;
	private Date purchase;
	private Date last;
	private Integer page; // 현재 페이지
	private Integer countPerPage; // 페이지당 게시글 수
    private Integer startRow;     // 시작 행 번호
    private Integer endRow;       // 끝 행 번호
    private int rnum;
    private String key_name;
	private String key_type;
	private String key_location;
	private String key_staus;
	private String searchType;
	private String searchKeyword;
	
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
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

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(Integer countPerPage) {
		this.countPerPage = countPerPage;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public Integer getEndRow() {
		return endRow;
	}
	public void setEndRow(Integer endRow) {
		this.endRow = endRow;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getKey_name() {
		return key_name;
	}
	public void setKey_name(String key_name) {
		this.key_name = key_name;
	}
	public String getKey_type() {
		return key_type;
	}
	public void setKey_type(String key_type) {
		this.key_type = key_type;
	}
	public String getKey_location() {
		return key_location;
	}
	public void setKey_location(String key_location) {
		this.key_location = key_location;
	}
	public String getKey_staus() {
		return key_staus;
	}
	public void setKey_staus(String key_staus) {
		this.key_staus = key_staus;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	@Override
	public String toString() {
		return "EquipmentDTO [equip_id=" + equip_id + ", name=" + name + ", type=" + type + ", location=" + location
				+ ", status=" + status + ", purchase=" + purchase + ", last=" + last + ", page=" + page
				+ ", countPerPage=" + countPerPage + ", startRow=" + startRow + ", endRow=" + endRow + ", rnum=" + rnum
				+ ", key_name=" + key_name + ", key_type=" + key_type + ", key_location=" + key_location
				+ ", key_staus=" + key_staus + ", searchType=" + searchType + "]";
	}
	

	
}
