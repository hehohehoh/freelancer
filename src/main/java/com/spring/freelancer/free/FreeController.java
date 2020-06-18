package com.spring.freelancer.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FreeController {
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
