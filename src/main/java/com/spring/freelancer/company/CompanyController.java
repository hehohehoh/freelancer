package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.freelancer.free.FreeVO;

public interface CompanyController {

	// 기업 회원가입
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 기업 아이디 중복체크
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO, Model model) throws Exception;

	// 기업 승인할 리스트
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 기업 승인
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 기업 로그인
	public ModelAndView login(@ModelAttribute("company") CompanyVO company, @ModelAttribute("free") FreeVO free, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView findid(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView findiddo(CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView findpw(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView findpwdo(CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	ModelAndView pwreset(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypagepw(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypagePwCheck(@ModelAttribute("info") CompanyVO companyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypageCareerin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView mypageProjectin(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypageCareerre(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypageProjecter(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView mypwreset(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView Compout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String listCompanys(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String compStop(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView delproject(@ModelAttribute("info") ProjectVO projectVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView searchComp(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
