package com.spring.freelancer.board.controller;

import org.springframework.ui.Model;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;

public interface BoardController {
	
	public void writeView() throws Exception;
	public String write(BoardVO boarVO) throws Exception;
	public String list(Model model, SearchCriteria scri) throws Exception;
	public String read(BoardVO boardVO, Model model) throws Exception;
	String updateView(BoardVO boardVO, Model model) throws Exception;
	String update(BoardVO boardVO) throws Exception;
	String delete(BoardVO boardVO) throws Exception;
	

}
