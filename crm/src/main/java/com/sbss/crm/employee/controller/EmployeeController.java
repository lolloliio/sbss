package com.sbss.crm.employee.controller;

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
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.employee.service.EmployeeService;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;
import com.sbss.crm.main.model.LoginVO;

/**
 * 직원 관리 Controller
 * @author pcj
 *
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 직원 목록 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/employeeList")
	public ModelAndView employeeList(EmployeeParam param) {
		ModelAndView mv = new ModelAndView("/employee/employeeList");
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("EMPLOYEE_STATUS");
		List<CommonCodeVO> employeeStatusList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("employeeStatusList", employeeStatusList);
		
		codeVO.setGroupCodeId("JOB_CLASS");
		List<CommonCodeVO> jobClassList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("jobClassList", jobClassList);		
		
		FranchiseeParam fcParam = new FranchiseeParam();
		List<FranchiseeVO> franchiseeList = commonCodeService.selectFranchiseeList(fcParam);
		mv.addObject("franchiseeList", franchiseeList);
		return mv;
	}
	
	/**
	 * 직원 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectEmployeeList")
	@ResponseBody
	public WrapperVO selectEmployeeList(@RequestBody EmployeeParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return employeeService.selectEmployeeList(param);
	}
	
	/**
	 * 직원 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/insertEmployeeInformation")
	@ResponseBody
	public ResultVO insertEmployeeInformation(EmployeeVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		return employeeService.insertEmployeeInformation(vo);
	}

	/**
	 * 직원 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/updateEmployeeInformation")
	@ResponseBody
	public ResultVO updateEmployeeInformation(EmployeeVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		return employeeService.updateEmployeeInformation(vo);
	}
	
}
