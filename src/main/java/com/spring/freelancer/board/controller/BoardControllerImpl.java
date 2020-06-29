package com.spring.freelancer.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.freelancer.board.service.BoardService;
import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.PageMaker;
import com.spring.freelancer.board.vo.SearchCriteria;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired 
	BoardVO boardVO;

	
	@Override
	@RequestMapping(value ="/board/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/board/list";
	}
	@Override
	@RequestMapping(value ="/board/writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public void writeView() throws Exception {
		logger.info("writeView");
	}
	@Override
	@RequestMapping(value="/board/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(BoardVO boardVO) throws Exception {
		logger.info("write");
		service.write(boardVO);
		return "redirect:/board/list";
	}
	@Override
	@RequestMapping(value="/board/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("read");
		model.addAttribute("read", service.read(boardVO.getBno()));
		return "board/readView";	
	}
	@Override
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		logger.info("updateView");	
		model.addAttribute("update", service.read(boardVO.getBno()));	
		return "board/updateView";
	}
	@Override
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO) throws Exception{
		logger.info("update");	
		service.update(boardVO);	
		return "redirect:/board/list";
	}
	@Override
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO) throws Exception {
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/board/list";
		
	}
	
	
	
}
