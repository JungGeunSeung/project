package kr.or.gaw.dto;

import java.sql.Date;

public class BoardDTO {

	private String board_id;
	private String board_name;
	private String created_by;
	private Date created_at;
	
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [board_id=" + board_id + ", board_name=" + board_name + ", created_by=" + created_by
				+ ", created_at=" + created_at + "]";
	}
}
