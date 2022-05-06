package com.sbss.crm.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 대쉬보드 관리 Controller
 * @author pcj
 *
 */
@Controller
@RequestMapping("/main")
public class DashboardController {

	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	/**
	 * 메인화면
	 * @return
	 */
	@RequestMapping(value = "/dashboard")
	public String dashboard() {
		logger.debug("대쉬보드 호출");
		return "/main/dashboard";
	}
	
}
