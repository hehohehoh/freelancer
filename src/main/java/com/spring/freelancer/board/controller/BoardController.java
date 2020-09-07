package com.spring.freelancer.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.freelancer.board.vo.BoardVO;
import com.spring.freelancer.board.vo.SearchCriteria;

public interface BoardController {

	public String writeView() throws Exception;

	public String write(BoardVO boarVO,MultipartHttpServletRequest mpRequest) throws Exception;
	public String list( Model model, SearchCriteria scri,HttpServletRequest request) throws Exception;

	public String read(BoardVO boardVO, SearchCriteria scri, Model model ) throws Exception;
	String updateView(BoardVO boardVO, SearchCriteria scri, Model model) throws Exception;
	String update(BoardVO boardVO,
			@ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr,
			@RequestParam(value="fileNodel[]") String[] files,
			@RequestParam(value="fileNameDel[]") String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception;
	String delete(BoardVO boardVO,SearchCriteria scri, RedirectAttributes rttr) throws Exception;
	void fileDown(Map<String, Object> map, HttpServletResponse response) throws Exception;


}
