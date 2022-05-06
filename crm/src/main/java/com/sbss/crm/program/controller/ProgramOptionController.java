package com.sbss.crm.program.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.main.model.LoginVO;
import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;
import com.sbss.crm.program.service.ProgramOptionService;

@Controller
@RequestMapping("/program")
public class ProgramOptionController {
	
	@Autowired
	ProgramOptionService programOptionService;
	
	/**
	 * 프로그램 옵션 관리 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/programOptionList")
	public ModelAndView programOptionList(ProgramOptionParam param) {
		ModelAndView mv = new ModelAndView("/program/programOptionList");		
		return mv;
	}
	
	/**
	 * 프로그램 옵션 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProgramOptionList")
	@ResponseBody
	public WrapperVO selectProgramOptionList(@RequestBody ProgramOptionParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return programOptionService.selectProgramOptionList(param);
	}
	
	/**
	 * 프로그램 옵션 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertProgramOptionInformation")
	@ResponseBody
	public ResultVO insertProgramOptionInformation(ProgramOptionVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeId(user.getEmployeeId());
		return programOptionService.insertProgramOptionInformation(vo);
	}
	
	/**
	 * 프로그램 옵션 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/updateProgramOptionInformation")
	@ResponseBody
	public ResultVO updateProgramOptionInformation(ProgramOptionVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeId(user.getEmployeeId());
		return programOptionService.updateProgramOptionInformation(vo);
	}

}
