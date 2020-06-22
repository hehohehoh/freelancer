package com.spring.freelancer.free;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeControllerImpl implements FreeController {

	@Autowired
	private FreeService freeService;
	@Autowired
	FreeVO freeVO;
	
	@Override
	@RequestMapping(value = "/free/listFreelancers.do", method = RequestMethod.GET)
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<FreeVO> freelancersList = freeService.listFreelancers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("freelancersList", freelancersList);
		return mav;
	}
	
	
	@RequestMapping(value = "/free/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String goPage = (String)request.getAttribute("viewName");
		return goPage;
	}
	@RequestMapping(value = "/free/form.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String freeForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {	
		String goPage = (String)request.getAttribute("viewName");
		return goPage;
	}
	@RequestMapping(value = "/free/addFree.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addFree(@ModelAttribute("free") FreeVO free, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {	
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = freeService.addFree(free);
		ModelAndView mav = new ModelAndView("redirect:/free/listFreelancers.do");

		return mav;
	}
	
	
	
	
	
	
	
}
