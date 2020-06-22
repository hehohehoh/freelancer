package com.spring.freelancer.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FreeController {
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String freeForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listFreelancers(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
