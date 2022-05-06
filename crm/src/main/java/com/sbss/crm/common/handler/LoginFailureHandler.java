package com.sbss.crm.common.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.sbss.crm.common.util.MessageUtils;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String loginIdName;
	private String loginPwdName;
	private String errorMsgName;
	private String defaultFailureUrl;
	
	public String getLoginIdName() {
		return loginIdName;
	}

	public void setLoginIdName(String loginIdName) {
		this.loginIdName = loginIdName;
	}

	public String getLoginPwdName() {
		return loginPwdName;
	}

	public void setLoginPwdName(String loginPwdName) {
		this.loginPwdName = loginPwdName;
	}

	public String getErrorMsgName() {
		return errorMsgName;
	}

	public void setErrorMsgName(String errorMsgName) {
		this.errorMsgName = errorMsgName;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String username = request.getParameter(loginIdName);
		String password = request.getParameter(loginPwdName);
		String errormsg = exception.getMessage();

        if(exception instanceof BadCredentialsException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof DisabledException) {
            errormsg = MessageUtils.getMessage("error.Disaled");
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = MessageUtils.getMessage("error.CredentialsExpired");
        }
        
		request.setAttribute(loginIdName, username);
		request.setAttribute(loginPwdName, password);        
        request.setAttribute(errorMsgName, errormsg);
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}
	
}
