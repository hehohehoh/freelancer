package com.spring.freelancer.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;
import com.spring.freelancer.mappers.BoardMapper;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private  BoardMapper boardMapper;
	@Autowired
	BoardVO boardVO;
	
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception{
		return boardMapper.listPage(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return boardMapper.listCount(scri); 		
	}
	
	@Override
	public void write(BoardVO boardVO) throws DataAccessException {
		boardMapper.insert(boardVO);
	}
	@Override
	public BoardVO read(int bno) throws Exception{
		return boardMapper.read(bno);
	}
	@Override
	public void update(BoardVO boardVO) throws Exception {
		boardMapper.update(boardVO);
	}
	@Override
	public void delete(int bno) throws Exception {
		boardMapper.delete(bno);
		
	}
	

	

}
