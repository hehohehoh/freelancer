package com.spring.freelancer.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.freelancer.board.service.BoardService;
import com.spring.freelancer.board.service.ReplyService;
import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.PageMaker;
import com.spring.freelancer.board.vo.ReplyVO;
import com.spring.freelancer.board.vo.SearchCriteria;
import com.spring.freelancer.free.FreeVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired 
	BoardVO boardVO;
	@Autowired
	private ReplyService replyService;

	//게시판 화면 불러오는 메소드
	@Override
	@RequestMapping(value ="/board/list", method = {RequestMethod.GET, RequestMethod.POST})
	public String list( Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request) throws Exception {
									//페이징 처리하는 Criteria를 상속받아 페이징 기능을 사용하고, SearchCriteria클래스의 검색 기능 활용
		logger.info("list");
		model.addAttribute("list", service.list(scri));
		model.addAttribute("notice", service.notice());
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);		// page와 perPageNum을 셋팅해준다.
		pageMaker.setTotalCount(service.listCount(scri));	//총 게시글의 수를 셋팅.
		model.addAttribute("pageMaker", pageMaker);	
		return "/board/list";
	}
	
	//게시글 작성 화면(writeView)으로 이동
	@Override
	@RequestMapping(value ="/board/writeView", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeView() throws Exception {
		logger.info("writeView");
		return "/board/writeView";
	}
	//게시글 작성
	@Override
	@RequestMapping(value="/board/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(BoardVO boardVO,MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("write");
		service.write(boardVO, mpRequest);
		return "redirect:/board/list";
	}
	//게시글 상세보기
	@Override
	@RequestMapping(value="/board/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model ) throws Exception{
		logger.info("read");
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		//댓글 리스트 표시 코드
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		//파일 표시하는 코드
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		System.out.println(fileList);

		return "board/readView";	
	}
	//게시글 수정 화면으로 이동
	@Override
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");	
		
		model.addAttribute("update", service.read(boardVO.getBno()));	
		model.addAttribute("scri", scri);
		
		//updateView에 파일리스트가 보이게 하는 코드
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		return "board/updateView";
	}
	//게시글 수정
	@Override
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(BoardVO boardVO,
			@ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files,//JSP에서 지정한 fileNoDel을 String[] 타입으로 담는다
			@RequestParam(value="fileNameDel[]") String[] fileNames,//JSP에서 지정한 fileNameDel을 String[] 타입으로 담는다
			MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("update");	
		
		service.update(boardVO, files, fileNames, mpRequest);
		
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	//게시글 삭제
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
	//파일 다운로드
	@Override
	@RequestMapping(value="/board/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\MyJava\\MyWebWorkspace01\\freelancer\\src\\main\\webapp\\resources\\boardFile\\"+storedFileName));
		//org.apache.commons.io.FileUtils 클래스의 메소드 readFileToByteArray를 사용하여
		//저장된 경로에서 #{bno} 값으로   첨부파일을 읽어 Byte[]형식으로 변환.
		System.out.println(fileByte);
		
		
		//MIME:  Multipurpose Internet Mail Extensions의 약자로 파일 변환을 의미.
		//response로 파일정보들을 담아 JSP화면으로 응답
		response.setContentType("application/octet-stream");//application/octet-stream :MIME 타입을 8비트 바이너리 배열로 지정(디코딩)
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		//setHeader : ("Content-Disposition","attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+")
		//괄호 안의 헤더가 이미 존재 한다면 그것 대신 "\";" 으로 대체
					
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
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
	public String replyUpdate(@SessionAttribute("free") FreeVO freeVO,ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
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
	
	/*
	 * @Override
	 * 
	 * @RequestMapping(value ="/board/list", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String notice( Model
	 * model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest
	 * request) throws Exception { //페이징 처리하는 Criteria를 상속받아 페이징 기능을 사용하고,
	 * SearchCriteria클래스의 검색 기능 활용 logger.info("list"); model.addAttribute("list",
	 * service.notice(scri)); PageMaker pageMaker = new PageMaker();
	 * pageMaker.setCri(scri); // page와 perPageNum을 셋팅해준다.
	 * pageMaker.setTotalCount(service.listCount(scri)); //총 게시글의 수를 셋팅.
	 * model.addAttribute("pageMaker", pageMaker); return "/board/list"; }
	 */
	
	
}
