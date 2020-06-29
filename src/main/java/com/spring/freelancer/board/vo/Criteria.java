package com.spring.freelancer.board.vo;



public class Criteria {
	
	private int page;	//페이지 시작번호
	private int perPageNum;		//페이지당 보여줄 페이지 갯수
	private int rowStart;
	private int rowEnd;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	//처음 게시판에 들어오게 되면 현재 페이지를 1로, 페이지당 보여줄 게시글의 수를 10으로 셋팅
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return ;
		}
		this.page = page;
	}
	//페이지가 음수 값이 되지않게 페이지가 0보다 작아질 경우 1로 셋팅.
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum  <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}		//페이지당 보여줄 게시글 수(perPageNum)가 변하지 않게 설정.
	
	public int getPage() {
		return page;	
	}
	public int getPerPage() {
		return (this.page - 1) * perPageNum;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) +1;
		return rowStart;
	}
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum -1;
		return rowEnd;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ",perPageNum=" + perPageNum + ", rowStart=" + rowStart +", rowEnd=" + rowEnd
				+"]";
	}

}
