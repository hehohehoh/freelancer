package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CompanyController {
	//public String login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//public String compForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView compForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO , Model model) throws Exception;
	
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception;
			
	public ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView findiddo(CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
