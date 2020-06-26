package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


public interface CompanyController {
	
	//기업 회원가입
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//기업 아이디 중복체크
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO , Model model) throws Exception;
	
	//기업 승인할 리스트
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//기업 승인
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//기업 로그인
	public ModelAndView login(@ModelAttribute("company") CompanyVO company,
            				HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
