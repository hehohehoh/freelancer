package com.spring.freelancer.company;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;




@RestController("companyController")
public class CompanyControllerImpl implements CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	CompanyVO companyVO ;

	@RequestMapping(value = "/comp/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request,
									HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/comp/compForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView compForm(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/comp/addCompany.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO,
            				HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_memail = request.getParameter("comp_memail1") + "@" + request.getParameter("comp_memail2");
		companyVO.setComp_memail(comp_memail);
		companyService.addCompanyInfo(companyVO);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	

	@Override
	@RequestMapping(value="/comp/overlap.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO , Model model) throws Exception {
		int result = companyService.compIdCheck(companyVO.getComp_id());
		return String.valueOf(result);
	}
	
	@Override
	@RequestMapping(value="/admin/compAppro.do" ,method = RequestMethod.GET)
	public ModelAndView compApproList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<CompanyVO> compApproList = companyService.listCompAppro();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("compApproList", compApproList);
		return mav;
	}

	@Override
	@RequestMapping(value="/admin/appro.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView compApprove(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String comp_id = request.getParameter("comp_id");
		companyService.updateComp(comp_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/compAppro.do");
		return mav;
	}

	
}