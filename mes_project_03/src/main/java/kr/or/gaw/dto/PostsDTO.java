package kr.or.gaw.dto;

import java.sql.Timestamp;

public class PostsDTO {

	private String post_id;
	private String board_id;
	private String board_name;
	private String title;
	private String content;
	private String author_id;
	private String name;
	private String author_name;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String pinned;
	private int view_cnt;
	private Integer page; // 현재 페이지
	private Integer countPerPage; // 페이지당 게시글 수
    private Integer startRow;     // 시작 행 번호
    private Integer endRow;       // 끝 행 번호
    private int rnum;
    private String searchType;
    private String searchKeyword;
    private String disPlayTime;
	
    
    


	public String getDisPlayTime() {
		return disPlayTime;
	}

	public void setDisPlayTime(String disPlayTime) {
		this.disPlayTime = disPlayTime;
	}

	public void calculateRows() {
        if (page != null && countPerPage != null) {
            this.startRow = (page - 1) * countPerPage + 1;
            this.endRow = page * countPerPage;
        }
    }

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

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
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
    
    
    
    
	
	
	}
