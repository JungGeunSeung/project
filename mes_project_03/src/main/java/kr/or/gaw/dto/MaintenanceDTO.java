package kr.or.gaw.dto;

import java.sql.Date;

public class MaintenanceDTO {

	private String main_id;
	private String equip_id;
	private Date main_date;
	private String performed_by;
	private String description;
	private String equip_name;
	private String equip_type;
	private String performer_name;
	private Integer page; // 현재 페이지
	private Integer countPerPage; // 페이지당 게시글 수
    private Integer startRow;     // 시작 행 번호
    private Integer endRow;       // 끝 행 번호
    private int rnum;
	private String searchType;
	private String searchKeyword;
	private Date startdate;
	private Date enddate;
	private String type;
	private String performed_name;
	private String performer_position;
	
	
	
	public String getPerformer_position() {
		return performer_position;
	}
	public void setPerformer_position(String performer_position) {
		this.performer_position = performer_position;
	}
	public String getPerformed_name() {
		return performed_name;
	}
	public void setPerformed_name(String performed_name) {
		this.performed_name = performed_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMain_id() {
		return main_id;
	}
	public void setMain_id(String main_id) {
		this.main_id = main_id;
	}
	public String getEquip_id() {
		return equip_id;
	}
	public void setEquip_id(String equip_id) {
		this.equip_id = equip_id;
	}
	public Date getMain_date() {
		return main_date;
	}
	public void setMain_date(Date main_date) {
		this.main_date = main_date;
	}
	public String getPerformed_by() {
		return performed_by;
	}
	public void setPerformed_by(String performed_by) {
		this.performed_by = performed_by;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEquip_name() {
		return equip_name;
	}
	public void setEquip_name(String equip_name) {
		this.equip_name = equip_name;
	}
	public String getEquip_type() {
		return equip_type;
	}
	public void setEquip_type(String equip_type) {
		this.equip_type = equip_type;
	}
	public String getPerformer_name() {
		return performer_name;
	}
	public void setPerformer_name(String performer_name) {
		this.performer_name = performer_name;
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
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	
	@Override
	public String toString() {
		return "MaintenanceDTO [main_id=" + main_id + ", equip_id=" + equip_id + ", main_date=" + main_date
				+ ", performed_by=" + performed_by + ", description=" + description + ", equip_name=" + equip_name
				+ ", equip_type=" + equip_type + ", performer_name=" + performer_name + ", page=" + page
				+ ", countPerPage=" + countPerPage + ", startRow=" + startRow + ", endRow=" + endRow + ", rnum=" + rnum
				+ ", searchType=" + searchType + ", searchKeyword=" + searchKeyword + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", type=" + type + ", performed_name=" + performed_name
				+ ", performer_position=" + performer_position + "]";
	}
	
	
	
}
