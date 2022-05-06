package com.sbss.crm.booking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbss.crm.booking.model.BookingParam;
import com.sbss.crm.booking.model.BookingVO;
import com.sbss.crm.booking.model.CalendarParam;
import com.sbss.crm.booking.model.CalendarVO;
import com.sbss.crm.booking.service.BookingService;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.commonCode.service.CommonCodeService;
import com.sbss.crm.customer.service.CustomerService;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.main.model.LoginVO;

/**
 * 예약 관리 Controller
 * @author pcj
 *
 */
@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	CustomerService customerService;
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	CommonCodeService commonCodeService;
	
	/**
	 * 예약 목록 화면 조회
	 * @return
	 */
	@RequestMapping("/bookingList")
	public ModelAndView bookingList() {
		ModelAndView mv = new ModelAndView("/booking/bookingList");
		return mv;
	}

	/**
	 * 예약 목록 조회
	 * 
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectBookingList")
	@ResponseBody
	public WrapperVO selectBookingList(@RequestBody BookingParam param) {
		return bookingService.selectBookingList(param);
	}
	
	/**
	 * 예약 등록 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bookingRegistration")	
	public ModelAndView bookingRegistration(BookingParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ModelAndView mv = new ModelAndView("/booking/bookingRegistration");	
		
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("BOOKING_STATUS");
		List<CommonCodeVO> bookingStatusList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("bookingStatusList", bookingStatusList);		
		
		EmployeeParam epParam = new EmployeeParam();
		epParam.setFranchiseeId(user.getFranchiseeId());
		List<EmployeeVO> employeeList = commonCodeService.selectEmployeeList(epParam);
		mv.addObject("employeeList", employeeList);
		
		return mv;
	}
	
	/**
	 * 예약 상세 화면 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bookingInformation")	
	public ModelAndView bookingInformation(BookingParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		
		ModelAndView mv = new ModelAndView("/booking/bookingInformation");
		
		CommonCodeVO codeVO = new CommonCodeVO();
		codeVO.setGroupCodeId("BOOKING_STATUS");
		List<CommonCodeVO> bookingStatusList = commonCodeService.selectCommonCodeList(codeVO);
		mv.addObject("bookingStatusList", bookingStatusList);

		EmployeeParam emParam = new EmployeeParam();
		emParam.setFranchiseeId(user.getFranchiseeId());
		List<EmployeeVO> employeeList =  commonCodeService.selectEmployeeList(emParam);
		mv.addObject("employeeList", employeeList);
		
		BookingVO booking = bookingService.selectBookingInformation(param);
		mv.addObject("booking", booking);
		
		return mv;
	}
	
	/**
	 * 예약 현황 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectBookingInformation")
	@ResponseBody
	public BookingVO selectBookingInformation(BookingParam param){
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());	
		return bookingService.selectBookingInformation(param);
	}	
	
	/**
	 * 예약 정보 저장
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/insertBookingInformation")
	@ResponseBody
	public ResultVO updateBookingInformation(BookingVO vo) {
		return bookingService.insertBookingInformation(vo);
	}
	
	/**
	 * 예약 정보 수정
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/updateBookingInformation")
	@ResponseBody
	public ResultVO updateEmployeeInformation(BookingVO vo) {
		return bookingService.updateBookingInformation(vo);
	}
	
	/**
	 * 예약 현황 조회 (달력)
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bookingCalendar")
	public ModelAndView bookingCalendar(BookingParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ModelAndView mv = new ModelAndView("/booking/bookingCalendar");
		return mv;
	}
	
	/**
	 * 예약 현황 목록 조회 (달력)
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/selectCalEventList")
	@ResponseBody
	public List<CalendarVO> selectCalEventList(CalendarParam param) {
		LoginVO user = (LoginVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		param.setFranchiseeId(user.getFranchiseeId());
		return bookingService.selectCalEventList(param);
	}
	
}
