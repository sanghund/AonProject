package com.aonproject.common.util.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	public static String DEFAULT_TARGET_PARAMETER = "spring-security-redirect-login-failuer";
	
	private String targetUrlPatameter = DEFAULT_TARGET_PARAMETER;
	
	public String getTargetUrlPatameter(){
		return targetUrlPatameter;
	}
	
	public void setTargetUrlPatameter(String targetUrlPatameter){
		this.targetUrlPatameter = targetUrlPatameter;
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String accept = request.getHeader("accept");
		String error = "true";
		String message = "로그인에 실패하였습니다.";
		
		if(StringUtils.indexOf(accept, "html") > -1){
			String redirectUrl = request.getParameter(this.targetUrlPatameter);
			if(redirectUrl != null){
				super.logger.debug("Found redirect URL: " + redirectUrl);
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			}
			else{
				super.onAuthenticationFailure(request, response, exception);
			}
		}
		else if(StringUtils.indexOf(accept, "xml") > -1){
			response.setContentType("application/xml");
			response.setCharacterEncoding("utf-8");
			
			String data = StringUtils.join(new String[]{
					"<?xml version=\"1.0\" encoding=\"UTF-8\"?>", 
					"<response>", 
					"<error>" , error , "</error>", "<message>" , 
					message , "</message>", 
					"</response>"
			});
			
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		}
		else if(StringUtils.indexOf(accept, "json") > -1){
			response.setContentType("application/json"); 
			response.setCharacterEncoding("utf-8"); 
			String data = StringUtils.join(new String[] { 
					" { \"response\" : {", 
					" \"error\" : " , error , ", ", 
					" \"message\" : \"", message , "\" ", 
					"} } " 
			});
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		}
	}
}
