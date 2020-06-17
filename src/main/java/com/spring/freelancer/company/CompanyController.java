package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompanyController {

	@RequestMapping(value = "/comp/loginForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String goPage = (String)request.getAttribute("viewName");
		
		return goPage;
	}
}
