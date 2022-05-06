package com.sbss.crm.booking.service;

import java.util.List;

import com.sbss.crm.booking.model.BookingParam;
import com.sbss.crm.booking.model.BookingVO;
import com.sbss.crm.booking.model.CalendarParam;
import com.sbss.crm.booking.model.CalendarVO;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;

public interface BookingService {
	
	/**
	 * 예약관리 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectBookingList(BookingParam param);
		
	/**
	 * 예약정보 조회
	 * @param param
	 * @return
	 */
	public BookingVO selectBookingInformation(BookingParam param);
	
	/**
	 * 예약정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertBookingInformation(BookingVO vo);
	
	/**
	 * 예약정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateBookingInformation(BookingVO vo);

	/**
	 * 예약현황 목록 조회
	 * @param param
	 * @return
	 */
	public List<CalendarVO> selectCalEventList(CalendarParam param);

}
