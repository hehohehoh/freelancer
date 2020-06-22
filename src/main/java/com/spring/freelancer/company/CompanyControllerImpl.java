package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller("companyController")
public class CompanyControllerImpl implements CompanyController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	CompanyVO companyVO ;
	
	@RequestMapping(value = "/comp/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String goPage = (String)request.getAttribute("viewName");
		
		return goPage;
	}
	
	@RequestMapping(value = "/comp/compForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String compForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String goPage = (String)request.getAttribute("viewName");
		
		return goPage;
	}

	@Override
	@RequestMapping(value="/comp/addCompany.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addCompany(@ModelAttribute("info") CompanyVO companyVO,
            				HttpServletRequest request, HttpServletResponse response) throws Exception {

		companyService.addCompanyInfo(companyVO);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/comp/overlap.do" ,method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String idDuplChk(@ModelAttribute("vo") CompanyVO companyVO , Model model) throws Exception {
		int result = companyService.compIdCheck(companyVO.getComp_id());
		return String.valueOf(result);
	}
	
}