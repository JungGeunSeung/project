package geun.document.dto;

import java.sql.Date;

public class DocumentDTO {
	private int document_id;
	private String userid;
	private String title;
	private String content;
	private Date created_date;
	private Date updated_date;
	private int version;
	
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "DocumentDTO [document_id=" + document_id + ", userid=" + userid + ", title=" + title + ", content="
				+ content + ", created_date=" + created_date + ", updated_date=" + updated_date + ", version=" + version
				+ "]";
	}
	
}
