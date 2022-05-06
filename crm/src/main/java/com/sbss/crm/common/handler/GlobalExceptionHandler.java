package com.sbss.crm.common.handler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.sbss.crm.common.model.ResultVO;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = RuntimeException.class)
	@ResponseBody
	public ResultVO defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		ResultVO result = new ResultVO();
		result.setResult("error");
		result.setErrorMessage(e.toString());
		return result;
	}
}
