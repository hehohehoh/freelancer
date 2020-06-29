package com.spring.freelancer.board.vo;


//Criteria를 extends했기때문에 SearchCriteria로 Criteria기능을 사용할 수 있음.
public class SearchCriteria extends Criteria{
	
	private String searchType = "";
	private String keyword = "";
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override 
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	


}
