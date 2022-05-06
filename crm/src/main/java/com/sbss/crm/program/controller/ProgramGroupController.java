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
import com.sbss.crm.program.model.ProgramGroupParam;
import com.sbss.crm.program.model.ProgramGroupVO;
import com.sbss.crm.program.service.ProgramGroupService;

@Controller
@RequestMapping("/program")
public class ProgramGroupController {
	
	@Autowired
	ProgramGroupService programGroupService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 프로그램 그룹 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/programGroupList")
	public ModelAndView programGroupList(ProgramGroupParam param) {
		ModelAndView mv = new ModelAndView("/program/programGroupList");
		
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
	 * 프로그램 그룹 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProgramGroupList")
	@ResponseBody
	public WrapperVO selectProgramGroupList(@RequestBody ProgramGroupParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return programGroupService.selectProgramGroupList(param);
	}
	
	/**
	 * 프로그램 그룹 코드 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectProgramGroupCodeList")
	@ResponseBody
	public List<ProgramGroupVO> selectProgramGroupCodeList(ProgramGroupParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return programGroupService.selectProgramGroupCodeList(param);
	}
	
	/**
	 * 프로그램 그룹 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertProgramGroupInformation")
	@ResponseBody
	public ResultVO insertProgramGroupInformation(ProgramGroupVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeeId(user.getEmployeeId());
		return programGroupService.insertProgramGroupInformation(vo);
	}
	
	/**
	 * 프로그램 그룹 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/updateProgramGroupInformation")
	@ResponseBody
	public ResultVO updateProgramGroupInformation(ProgramGroupVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeeId(user.getEmployeeId());
		return programGroupService.updateProgramGroupInformation(vo);
	}

}
