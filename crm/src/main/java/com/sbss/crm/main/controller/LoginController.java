package com.sbss.crm.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 로그인 관리 Controller
 * @author pcj
 *
 */
@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 처음 화면
	 * @return
	 */
	@RequestMapping(value = "/")
	public ModelAndView home() {
		
		BCryptPasswordEncoder en = new BCryptPasswordEncoder();
		String encPassword = en.encode("!qwer1234");
		logger.info("암호화된 비밀번호 : "+encPassword);
		
		ModelAndView mv = new ModelAndView("redirect:/main/dashboard");
		return mv;
	}

	/**
	 * 로그인 화면
	 * @return
	 */
	@RequestMapping(value = "/login/signIn")
	public ModelAndView loginPage() {
		ModelAndView mv = new ModelAndView("/login/signIn");
		return mv;
	}
	
	/**
	 * 회원가입 화면
	 * @return
	 */
	@RequestMapping(value = "/login/signUp")
	public ModelAndView signUp() {
		ModelAndView mv = new ModelAndView("/login/signUp");
		return mv;
	}
	
	/**
	 * 접근 권한이 없는 페이지
	 * @return
	 */
	@RequestMapping(value="/login/accessDenied")
	public ModelAndView assessDenied() {
		logger.debug("접근 권한이 없습니다.");		
		ModelAndView mv = new ModelAndView("/accessDenied"); 
		return mv;
	}	

	/**
	 * 로그인
	 */
	@RequestMapping(value="/login/login")
	public void login() {
		logger.debug("로그인 호출");
	}
	
	/**
	 * 로그아웃
	 */
	@RequestMapping(value="/login/logout")
	public void logout() {
		logger.debug("로그아웃 호출");
	}
	
}