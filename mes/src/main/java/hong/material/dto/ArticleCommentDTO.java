package hong.material.dto;

import java.sql.Date;

public class ArticleCommentDTO {

	String commentid;
	String writeid;
	String content;
	Date createdate;
	Date updatedate;
	String status;
	
	public String getCommentid() {
		return commentid;
	}
	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}
	public String getWriteid() {
		return writeid;
	}
	public void setWriteid(String writeid) {
		this.writeid = writeid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
