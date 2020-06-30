package com.spring.freelancer.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.freelancer.board.service.BoardService;
import com.spring.freelancer.board.service.ReplyService;
import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.PageMaker;
import com.spring.freelancer.board.vo.ReplyVO;
import com.spring.freelancer.board.vo.SearchCriteria;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired 
	BoardVO boardVO;
	@Autowired
	private ReplyService replyService;

	
	@Override
	@RequestMapping(value ="/board/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(@RequestParam("free_id") String free_id, Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
									//페이징 처리하는 Criteria를 상속받아 페이징 기능을 사용하고, SearchCriteria클래스의 검색 기능 활용
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		System.out.println(free_id);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);		// page와 perPageNum을 셋팅해준다.
		pageMaker.setTotalCount(service.listCount(scri));	//총 게시글의 수를 셋팅.
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("free_id", free_id);
		
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
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		return "board/readView";	
	}

	@Override
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");	
		model.addAttribute("update", service.read(boardVO.getBno()));	
		model.addAttribute("scri", scri);
		return "board/updateView";
	}
	@Override
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");	
		service.update(boardVO);	
		
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	@Override
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
		
	}
	
	
	
	
	
	
	
	
	//댓글 관련 메서드

	@Override
	@RequestMapping(value="/board/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply Write");
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	@RequestMapping(value="/board/replyUpdateView", method = {RequestMethod.GET,RequestMethod.POST})
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception{
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	@RequestMapping(value="/board/replyUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply Write");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	

	
	@RequestMapping(value="/board/replyDeleteView", method = {RequestMethod.GET,RequestMethod.POST})
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception{
		logger.info("reply Write");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		
		return "board/replyDeleteView";
	}
	
	@RequestMapping(value="/board/replyDelete", method = {RequestMethod.GET,RequestMethod.POST})
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("reply Write");

		replyService.deleteReply(vo);
			
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		
		return "redirect:/board/readView";
	}
	
	
	
}
