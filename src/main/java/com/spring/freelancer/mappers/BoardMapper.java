package com.spring.freelancer.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;


@Mapper
public interface BoardMapper {
	//게시글 쓰기
	public void insert(BoardVO boardVO) throws Exception;
	//게시판 메인화면
	public List<BoardVO> listPage(SearchCriteria scri) throws Exception;
	//총 게시글 수 카운팅
	public int listCount(SearchCriteria scri) throws Exception;
	//게시글 상세보기
	public BoardVO read(int bno) throws Exception;
	//게시글 수정
	public void update(BoardVO boardVO) throws Exception;
	//게시글 삭제
	public void delete(int bno) throws Exception;
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	//첨부파일 다운로드
	public Map<String, Object> selectFileInfo(Map<String, Object>map) throws Exception;
	//첨부파일 수정
	public void updateFile(Map<String, Object>map)throws Exception;
	//게시글 조회수
	public void boardHit(int bno) throws Exception;	
	//공지사항 
	public List<BoardVO> notice() throws Exception;

	 
	
	
}
