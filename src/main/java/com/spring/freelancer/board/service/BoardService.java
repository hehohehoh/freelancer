package com.spring.freelancer.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;

public interface BoardService {
	
	public void write(BoardVO boardVO) throws DataAccessException;

	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	

}
