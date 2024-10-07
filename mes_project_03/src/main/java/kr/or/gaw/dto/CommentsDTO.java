package kr.or.gaw.dto;

import java.sql.Date;

public class CommentsDTO {

	private String comment_id;
	private String post_id;
	private String employee_id;
	private String content;
	private Date ceated_at;
	
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCeated_at() {
		return ceated_at;
	}
	public void setCeated_at(Date ceated_at) {
		this.ceated_at = ceated_at;
	}
	
	@Override
	public String toString() {
		return "CommentsDTO [comment_id=" + comment_id + ", post_id=" + post_id + ", employee_id=" + employee_id
				+ ", content=" + content + ", ceated_at=" + ceated_at + "]";
	}
}
