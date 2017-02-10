package com.aonproject.common.util.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler{
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String accept = request.getHeader("accept");
		
		if(StringUtils.indexOf(accept, "json") > -1){
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			
			String data = StringUtils.join(new String[] { 
					" { \"response\" : {", 
					" \"error\" : false , ",
					" \"returnUrl\" : \""+ getReturnUrl(request, response).trim() + "\" ",
					"} } " 
			});
			
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		}
	}
	
	private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) { 
		RequestCache requestCache = new HttpSessionRequestCache(); 
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
		if (savedRequest == null) { 
			return request.getSession().getServletContext().getContextPath(); 
		} 
		return savedRequest.getRedirectUrl(); 
	}
}
