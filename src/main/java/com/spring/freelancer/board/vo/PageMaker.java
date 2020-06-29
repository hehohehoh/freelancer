package com.spring.freelancer.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


//이해를 참고할만한 페이지 (https://to-dy.tistory.com/90)
public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;	//하단에 보이는 페이지 버튼의 수
	private Criteria cri;
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}	//총 게시글 수를 셋팅할때 calcData() 메서드를 호출하여 페이징 관련 버튼 계산을 한다.
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public Criteria getCri() {
		return cri;
	}
	
	
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum); 
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if ( endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true; // 이전 버튼은 시작 페이지 번호가 1이 아니면 생성. 	
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		//다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 갯수 < 총 게시글의 수 ? true: false
		
	}	//페이징의 버튼들을 생성하는 계산식을 만들었다. 끝 페이지 번호, 시작페이지 번호, 이전, 다음 버튼들을 구한다.
		//cri.getPage() : 시작페이지 번호 
		//cri.getPerPageNum() : 한 페이지당 보여줄 게시글의 갯수 
		//int endPage : 화면에 보여질 마지막 페이지 번호,끝 페이지 번호.
	/* 마지막 페이지의 번호를 구한 뒤, 끝 페이지 번호보다 작은 경우에 마지막 페이지의 번호를 끝 페이지 번호로 저장해준다. 
	 * 화면에 보여질 끝 페이지 번호는 마지막 페이지의 번호보다 클 수는 없다. 그렇기 때문에 위와 같은 조건을 넣어줘야 한다. 
	 * 이 부분은 시작 페이지 번호까지 구한 뒤에 처리해줘야 한다.
	*/
	
	
	public String makeQuery(int page) {
		UriComponents uriComponents = 
		UriComponentsBuilder.newInstance()
							.queryParam("page", page)
							.queryParam("perPageNum", cri.getPerPageNum())
							.build();
		return uriComponents.toUriString();						
	}
	
	
	
	// page, perPageNum, searchType, keyword를 url로 사용할수 있도록하는 makeSearch 메서드
	// UriComponents에 관한 링크(https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/util/UriComponents.html)
	public String makeSearch(int page) {
		UriComponents uriComponents = // UriComponentsBuilder의 정적 메서드 newInstance로 
									 //여러 개 파라미터들을 연결하여 하나의 URL 링크로 만들어서 반환
				
				UriComponentsBuilder.newInstance()	//비어있는 새 UriComponent를 생성
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
					//검색시 사용 되는 검색 타입
				
				.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
					//검색시 사용자가 입력하는 검색 키워드
				.build();	
					//여기까지 덧 붙여진 데이터를 이용해서 합친다는 뜻의 build()
				return uriComponents.toUriString();	//붙여진 값들로 String문을 작성후 인코딩 및 반환 
	}
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	

	

}
