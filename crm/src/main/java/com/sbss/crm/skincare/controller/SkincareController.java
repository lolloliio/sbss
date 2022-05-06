package com.sbss.crm.skincare.controller;

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
import com.sbss.crm.customer.model.CustomerParam;
import com.sbss.crm.customer.model.CustomerVO;
import com.sbss.crm.customer.service.CustomerService;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.employee.service.EmployeeService;
import com.sbss.crm.main.model.LoginVO;
import com.sbss.crm.program.model.ProgramOptionParam;
import com.sbss.crm.program.model.ProgramOptionVO;
import com.sbss.crm.program.service.ProgramOptionService;
import com.sbss.crm.skincare.model.SkincareParam;
import com.sbss.crm.skincare.model.SkincareVO;
import com.sbss.crm.skincare.service.SkincareService;

@Controller
@RequestMapping("/skincare")
public class SkincareController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	SkincareService skincareService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	@Autowired
	ProgramOptionService programOptionService;
	
	/**
	 * 피부관리 목록 화면 조회
	 * @return
	 */
	@RequestMapping("/skincareList")
	public ModelAndView skincare() {
		ModelAndView mv = new ModelAndView("/skincare/skincareList");
		return mv;
	}
	
	/**
	 * 피부관리 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectSkincareList")
	@ResponseBody
	public WrapperVO selectSkincareList(@RequestBody SkincareParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return skincareService.selectSkincareList(param);
	}
	
	/**
	 * 피부관리 등록 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/skincareRegistration")
	public ModelAndView skincareRegistration(SkincareParam param) {
		
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ModelAndView mv = new ModelAndView("/skincare/skincareRegistration");
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("GENDER");
		List<CommonCodeVO> genderList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("genderList", genderList);
		
		codeVO.setGroupCodeId("PART");
		List<CommonCodeVO> partList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("partList", partList);
		
		codeVO.setGroupCodeId("SKINCARE_STATUS");
		List<CommonCodeVO> skincareStatusList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skincareStatusList", skincareStatusList);
		
		EmployeeParam employeeParam = new EmployeeParam();
		employeeParam.setFranchiseeId(user.getFranchiseeId());
		List<EmployeeVO> employeeList = employeeService.selectEmployeeCodeList(employeeParam);
		mv.addObject("employeeList", employeeList);
		
		ProgramOptionParam programOptionParam = new ProgramOptionParam();
		programOptionParam.setFranchiseeId(user.getFranchiseeId());
		List<ProgramOptionVO> programOptionList = programOptionService.selectProgramOptionCodeList(programOptionParam);
		mv.addObject("programOptionList", programOptionList);
		
		CustomerParam customerParam = new CustomerParam();
		customerParam.setCustomerId(param.getCustomerId());
		CustomerVO customer = customerService.selectCustomerInformation(customerParam);
		mv.addObject("customer", customer);
		
		return mv;
	}
	
	/**
	 * 피부관리 정보 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectSkincareInformation")
	@ResponseBody
	public SkincareVO selectSkinCareInformation(SkincareParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return skincareService.selectSkincareInformation(param);
	}

	/**
	 * 피부관리 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertSkincareInformation")
	@ResponseBody
	public ResultVO insertSkincareInformation(SkincareVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		vo.setEmployeeId(user.getEmployeeId());
		return skincareService.insertSkincareInformation(vo);
	}
	
	/**
	 * 피부관리 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping("/updateSkincareInformation")
	@ResponseBody
	public ResultVO updateSkincareInformation(SkincareVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setFranchiseeId(user.getFranchiseeId());
		return skincareService.updateSkincareInformation(vo);
	}

	/**
	 * 고객 피부관리 목록 조회 
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectCustomerCareList")
	@ResponseBody	
	public WrapperVO selectCustomerCareList(@RequestBody SkincareParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return skincareService.selectCustomerCareList(param);
	}
	
}
