package com.spring.freelancer.free;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


public interface FreeController {
	public String loginForm(@RequestParam(value="status", required=false )String status, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView freeStop(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addFree(@ModelAttribute("free") FreeVO freeVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") FreeVO freeVO  , Model model) throws Exception;

	public ModelAndView login(@ModelAttribute("free") FreeVO free, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String logout(HttpSession session) throws Exception;
	
	public ModelAndView updateDetailInfo(HttpSession session,
			@RequestParam(value = "free_pic", required = false) MultipartFile file) throws Exception;
	
	ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView findpw(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	ModelAndView findiddo(FreeVO freeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView findpwdo(FreeVO freeVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView freeSearchList(@RequestParam(value="lan") List<String> lanList, 
            @RequestParam(value="free_level") String free_level, @RequestParam(value="free_addr") String free_addr,
                     HttpServletRequest request, HttpServletResponse response) throws Exception;
   
    public @ResponseBody Map<String, Object> More(@RequestParam(value = "lan") List<String> lanList,
         @RequestParam(value = "free_level") String free_level, @RequestParam(value = "free_addr") String free_addr,
         HttpServletRequest request, HttpServletResponse response) throws Exception;
   
    public String freeDetail(@RequestParam(value = "free_id") String free_id,
         HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
