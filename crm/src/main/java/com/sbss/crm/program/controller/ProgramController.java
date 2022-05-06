package com.sbss.crm.program.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.commonCode.service.CommonCodeService;
import com.sbss.crm.main.model.LoginVO;
import com.sbss.crm.program.model.ProgramParam;
import com.sbss.crm.program.model.ProgramVO;
import com.sbss.crm.program.service.ProgramService;

@Controller
@RequestMapping("/program")
public class ProgramController {
	
	@Autowired
	ProgramService programService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 프로그램 화면 조회
	 * @return
	 */
	@RequestMapping("/programList")
	public ModelAndView programList() {
		ModelAndView mv = new ModelAndView("/program/programList");
		
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("GENDER");
		List<CommonCodeVO> genderList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("genderList", genderList);
		
		codeVO.setGroupCodeId("PART");
		List<CommonCodeVO> partList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("partList", partList);		
		
		return mv;
	}
	
	/**
	 * 프로그램 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProgramList")
	@ResponseBody
	public WrapperVO selectProgramList(@RequestBody ProgramParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return programService.selectProgramList(param);
	}
	
	/**
	 * 프로그램 코드 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProgramCodeList")
	@ResponseBody
	public List<ProgramVO> selectProgramCodeList(ProgramParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return programService.selectProgramCodeList(param);
	}
	
	/**
	 * 프로그램 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertProgramInformation")
	@ResponseBody
	public ResultVO insertProgramInfomation(ProgramVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeId(user.getEmployeeId());
		return programService.insertProgramInformation(vo);
	}
	
	/**
	 * 프로그램 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/updateProgramInformation")
	@ResponseBody
	public ResultVO updateProgramInformation(ProgramVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeId(user.getEmployeeId());
		return programService.updateProgramInformation(vo);
	}

}
