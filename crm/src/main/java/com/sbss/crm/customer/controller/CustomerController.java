package com.sbss.crm.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.sbss.crm.main.model.LoginVO;

/**
 * 고객 관리 Controller
 * 
 * @author pcj
 *
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	CommonCodeService commonCodeService;

	/**
	 * 고객 목록 화면 조회
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/customerList")
	public String customerList(Model model, CustomerParam param) {
		return "/customer/customerList";
	}

	/**
	 * 고객 목록 조회
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectCustomerList")
	@ResponseBody
	public WrapperVO selectCustomerList(@RequestBody CustomerParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return customerService.selectCustomerList(param);
	}

	/**
	 * 고객 등록 화면 조회
	 * 
	 * @return
	 */
	@RequestMapping(value = "/customerRegistration")
	public ModelAndView customerRegistration() {
		ModelAndView mv = new ModelAndView("/customer/customerRegistration");
				
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("GENDER");
		List<CommonCodeVO> genderList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("genderList", genderList);

		codeVO.setGroupCodeId("VISIT_PATH");
		List<CommonCodeVO> visitPathList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("visitPathList", visitPathList);
		
		codeVO.setGroupCodeId("INTERESTS");
		List<CommonCodeVO> interestsList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("interestsList", interestsList);		
		
		codeVO.setGroupCodeId("SKIN_TYPE");
		List<CommonCodeVO> skinTypeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinTypeList", skinTypeList);
		
		codeVO.setGroupCodeId("SKIN_PROBLEM");
		List<CommonCodeVO> skinProblemList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinProblemList", skinProblemList);

		codeVO.setGroupCodeId("PROBLEM_OCCUR_TIME");
		List<CommonCodeVO> skinOcrTimeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinOcrTimeList", skinOcrTimeList);
		
		codeVO.setGroupCodeId("PIMPLE_OCCUR_POINT");
		List<CommonCodeVO> pimpleList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("pimpleList", pimpleList);
		
		codeVO.setGroupCodeId("TROUBLE_OCCUR_TIME");
		List<CommonCodeVO> tbOcrTimeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("tbOcrTimeList", tbOcrTimeList);

		codeVO.setGroupCodeId("ALLERGY");
		List<CommonCodeVO> allergyList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("allergyList", allergyList);
		
		codeVO.setGroupCodeId("MEMBERSHIP_LEVEL");
		List<CommonCodeVO> membershipLvList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("membershipLvList", membershipLvList);
		
		codeVO.setGroupCodeId("INTENSITY");
		List<CommonCodeVO> intensityList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("intensityList", intensityList);
		
		return mv;
	}

	/**
	 * 고객 상세 정보 조회
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping("/customerInformation") 
	public ModelAndView customerInformation(CustomerParam param) {
		
		ModelAndView mv = new ModelAndView("/customer/customerInformation");
		mv.addObject("customerId", param.getCustomerId());
		mv.addObject("customerName", param.getCustomerName());
		mv.addObject("pageType", param.getPageType());
	
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("GENDER");
		List<CommonCodeVO> genderList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("genderList", genderList);		

		codeVO.setGroupCodeId("VISIT_PATH");
		List<CommonCodeVO> visitPathList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("visitPathList", visitPathList);
		
		codeVO.setGroupCodeId("INTERESTS");
		List<CommonCodeVO> interestsList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("interestsList", interestsList);		
		
		codeVO.setGroupCodeId("SKIN_TYPE");
		List<CommonCodeVO> skinTypeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinTypeList", skinTypeList);
		
		codeVO.setGroupCodeId("SKIN_PROBLEM");
		List<CommonCodeVO> skinProblemList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinProblemList", skinProblemList);

		codeVO.setGroupCodeId("PROBLEM_OCCUR_TIME");
		List<CommonCodeVO> skinOcrTimeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("skinOcrTimeList", skinOcrTimeList);
		
		codeVO.setGroupCodeId("PIMPLE_OCCUR_POINT");
		List<CommonCodeVO> pimpleList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("pimpleList", pimpleList);
		
		codeVO.setGroupCodeId("TROUBLE_OCCUR_TIME");
		List<CommonCodeVO> tbOcrTimeList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("tbOcrTimeList", tbOcrTimeList);

		codeVO.setGroupCodeId("ALLERGY");
		List<CommonCodeVO> allergyList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("allergyList", allergyList);
		
		codeVO.setGroupCodeId("MEMBERSHIP_LEVEL");
		List<CommonCodeVO> membershipLvList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("membershipLvList", membershipLvList);
		
		codeVO.setGroupCodeId("INTENSITY");
		List<CommonCodeVO> intensityList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("intensityList", intensityList);
		
		return mv;
	}
	
	/**
	 * 고객 정보 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectCustomerInformation")
	@ResponseBody
	public CustomerVO selectCustomerInformation(CustomerParam param) {
		return customerService.selectCustomerInformation(param);
	}

	/**
	 * 고객 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/insertCustomerInformation")
	@ResponseBody
	public ResultVO insertCustomerInformation(CustomerVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int franchiseeId = user.getFranchiseeId();
		int employeeId = user.getEmployeeId();
		vo.setFranchiseeId(franchiseeId);
		vo.setEmployeeId(employeeId);
		return customerService.insertCustomerInformation(vo);
	}

	/**
	 * 고객 정보 수정
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/updateCustomerInformation")
	@ResponseBody
	public ResultVO updateCustomerInformation(CustomerVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int employeeId = user.getEmployeeId();
		vo.setEmployeeId(employeeId);
		return customerService.updateCustomerInformation(vo);
	}

}
