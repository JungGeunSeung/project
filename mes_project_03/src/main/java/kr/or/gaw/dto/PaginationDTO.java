package kr.or.gaw.dto;

import org.springframework.stereotype.Component;

public class PaginationDTO {
	private int currentPage;   // 현재 페이지
    private int totalPages;    // 전체 페이지 수
    private int startPage;     // 페이지네이션 시작 페이지
    private int endPage;       // 페이지네이션 끝 페이지
    private boolean hasPrev;   // 이전 페이지 존재 여부
    private boolean hasNext;   // 다음 페이지 존재 여부
    private int prevPage;      // 이전 페이지 번호
    private int nextPage;      // 다음 페이지 번호
    private int countPerPage;  // 페이지 당 항목 수

    // 생성자
    public PaginationDTO(int currentPage, int totalPages, int startPage, int endPage,
                         boolean hasPrev, boolean hasNext, int prevPage, int nextPage, int countPerPage) {
        this.currentPage = currentPage;
        this.totalPages = totalPages;
        this.startPage = startPage;
        this.endPage = endPage;
        this.hasPrev = hasPrev;
        this.hasNext = hasNext;
        this.prevPage = prevPage;
        this.nextPage = nextPage;
        this.countPerPage = countPerPage;
    }

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isHasPrev() {
		return hasPrev;
	}

	public void setHasPrev(boolean hasPrev) {
		this.hasPrev = hasPrev;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
    
    
}
