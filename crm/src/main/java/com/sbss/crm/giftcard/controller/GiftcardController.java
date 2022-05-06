package com.sbss.crm.giftcard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.giftcard.service.GiftcardService;
import com.sbss.crm.main.model.LoginVO;
import com.sbss.crm.giftcard.model.GiftcardHistoryParam;
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;

@Controller
@RequestMapping("/giftcard")
public class GiftcardController {
	
	@Autowired
	GiftcardService giftcardService;
	
	/**
	 * 기프트카드 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/giftcardList")
	public ModelAndView giftcardList(GiftcardParam param) {
		ModelAndView mv = new ModelAndView("/giftcard/giftcardList");
		return mv;
	}	
	
	/**
	 * 기프트카드 내역 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectGiftcardList")
	@ResponseBody
	public WrapperVO selectGiftcardList(@RequestBody GiftcardParam param) {		
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return giftcardService.selectGiftcardList(param);
	}
	
	/**
	 * 기프트카드 등록 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/giftcardRegistration")
	public ModelAndView giftcardRegistration(GiftcardParam param) {
		ModelAndView mv = new ModelAndView("/giftcard/giftcardRegistration");
		return mv;
	}
	
	/**
	 * 기프트카드 히스토리 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/giftcardHistoryList")
	public ModelAndView giftcardHistoryList(GiftcardParam param) {
		ModelAndView mv = new ModelAndView("/giftcard/giftcardHistoryList");
		mv.addObject("giftcardId", param.getGiftcardId());
		mv.addObject("customerId", param.getCustomerId());
		mv.addObject("customerName", param.getCustomerName());
		return mv;
	}
	
	/**
	 * 기프트카드 히스토리 내역 조회
	 * @param param
	 * @return
	 */
	@RequestMapping("/selectGiftcardHistoryList")
	@ResponseBody
	public WrapperVO selectGiftcardHistoryList(@RequestBody GiftcardHistoryParam param) {		
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return giftcardService.selectGiftcardHistoryList(param);
	}
	
	/**
	 * 기프트카드 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping("/insertGiftcardInformation")
	@ResponseBody
	public ResultVO insertGiftcardInformation(GiftcardHistoryVO vo) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setEmployeeId(user.getEmployeeId());
		return giftcardService.insertGiftcardInformation(vo);
	}	

}
