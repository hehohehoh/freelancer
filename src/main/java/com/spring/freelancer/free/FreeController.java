package com.spring.freelancer.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public interface FreeController {
	public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String freeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addFree(@ModelAttribute("free") FreeVO freeVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") FreeVO freeVO  , Model model) throws Exception;

	public ModelAndView login(@ModelAttribute("free") FreeVO free, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView updateDetailInfo(@ModelAttribute("free") FreeVO free,
			@RequestParam(value = "free_pic", required = false) MultipartFile file,
			@RequestParam(value = "career_cnt") int career_cnt ) throws Exception;
	
}
