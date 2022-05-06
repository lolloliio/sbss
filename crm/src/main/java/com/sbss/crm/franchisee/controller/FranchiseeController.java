package com.sbss.crm.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.commonCode.service.CommonCodeService;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;
import com.sbss.crm.franchisee.service.FranchiseeService;

/**
 * 가맹점 관리 Controller
 * @author pcj
 *
 */
@Controller
@RequestMapping("/franchisee")
public class FranchiseeController {
	
	@Autowired
	FranchiseeService franchiseeService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 가맹점 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/franchiseeList")
	public ModelAndView franchiseeList(FranchiseeParam param) {
		ModelAndView mv = new ModelAndView("/franchisee/franchiseeList");
		CommonCodeVO vo = new CommonCodeVO();
		vo.setGroupCodeId("FRANCHISEE_STATUS");
		List<CommonCodeVO> franchiseeStatusList = commonCodeService.selectCommonCodeList(vo);
		mv.addObject("franchiseeStatusList", franchiseeStatusList);		
		return mv;
	}
	
	/**
	 * 가맹점 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectFranchiseeList")
	@ResponseBody
	public WrapperVO selectFranchiseeList(@RequestBody FranchiseeParam param) {
		return franchiseeService.selectFranchiseeList(param);
	}
	
	/**
	 * 가맹정 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/insertFranchiseeInformation")
	@ResponseBody
	public ResultVO insertFranchiseeInformation(FranchiseeVO vo) {
		return franchiseeService.insertFranchiseeInformation(vo);
	}
	
	/**
	 * 가맹점 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/updateFranchiseeInformation")
	@ResponseBody
	public ResultVO updateCustomerInformation(FranchiseeVO vo) {
		return franchiseeService.updateFranchiseeInformation(vo);
	}

}
