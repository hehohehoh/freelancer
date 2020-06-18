package com.spring.freelancer.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CompanyController {
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
