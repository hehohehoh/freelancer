package com.spring.freelancer.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;


@Mapper
public interface BoardMapper {
	
	public void insert(BoardVO boardVO) throws DataAccessException;

	public List<BoardVO> listPage(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;

	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	
	public void delete(int bno) throws Exception;
	
	
}
