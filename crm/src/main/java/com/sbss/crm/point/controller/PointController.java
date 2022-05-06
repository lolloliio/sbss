package com.sbss.crm.point.controller;

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
import com.sbss.crm.point.model.PointHistoryParam;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	PointService pointService;
	
	/**
	 * 포인트 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/pointList")
	public ModelAndView pointList(PointParam param) {
		ModelAndView mv = new ModelAndView("/point/pointList");
		return mv;
	}
		
	/**
	 * 포인트 내역 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectPointList")
	@ResponseBody
	public WrapperVO selectPointList(@RequestBody PointParam param) {		
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return pointService.selectPointList(param);
	}
	
	/**
	 * 포인트 등록 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/pointRegistration")
	public ModelAndView pointRegistration(PointParam param) {
		ModelAndView mv = new ModelAndView("/point/pointRegistration");
		return mv;
	}
	
	/**
	 * 포인트 히스토리 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/pointHistoryList")
	public ModelAndView pointHistoryList(PointParam param) {
		ModelAndView mv = new ModelAndView("/point/pointHistoryList");
		mv.addObject("pointId", param.getPointId());
		mv.addObject("customerId", param.getCustomerId());
		mv.addObject("customerName", param.getCustomerName());
		return mv;
	}
	
	/**
	 * 포인트 히스토리 내역 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectPointHistoryList")
	@ResponseBody
	public WrapperVO selectPointHistoryList(@RequestBody PointHistoryParam param) {		
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return pointService.selectPointHistoryList(param);
	}
	
	/**
	 * 포인트 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertPointInformation")
	@ResponseBody
	public ResultVO insertPointInformation(PointHistoryVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setEmployeeId(user.getEmployeeId());
		return pointService.insertPointInformation(vo);
	}
	
}
