package com.spring.freelancer.board.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.ReplyVO;
import com.spring.freelancer.board.vo.SearchCriteria;

public interface BoardController {
	
	public void writeView() throws Exception;
	public String write(BoardVO boarVO) throws Exception;
	public String list(@RequestParam("free_id") String free_id, Model model, SearchCriteria scri) throws Exception;
	public String read(BoardVO boardVO, SearchCriteria scri, Model model) throws Exception;
	String updateView(BoardVO boardVO, SearchCriteria scri, Model model) throws Exception;
	String update(BoardVO boardVO,SearchCriteria scri, RedirectAttributes rttr) throws Exception;
	String delete(BoardVO boardVO,SearchCriteria scri, RedirectAttributes rttr) throws Exception;
	String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception;
	

}
