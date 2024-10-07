package kr.or.gaw.dto;

import java.sql.Date;

public class PostsDTO {

	private String post_id;
	private String board_id;
	private String title;
	private String content;
	private String author_id;
	private Date createf_at;
	private Date updated_at;
	private String pinned;
	private int view_cnt;
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
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
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public Date getCreatef_at() {
		return createf_at;
	}
	public void setCreatef_at(Date createf_at) {
		this.createf_at = createf_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public String getPinned() {
		return pinned;
	}
	public void setPinned(String pinned) {
		this.pinned = pinned;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	@Override
	public String toString() {
		return "PostsDTO [post_id=" + post_id + ", board_id=" + board_id + ", title=" + title + ", content=" + content
				+ ", author_id=" + author_id + ", createf_at=" + createf_at + ", updated_at=" + updated_at + ", pinned="
				+ pinned + ", view_cnt=" + view_cnt + "]";
	}
	
}
