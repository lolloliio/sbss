package com.sbss.crm.booking.dao;

import java.util.List;

import com.sbss.crm.booking.model.BookingParam;
import com.sbss.crm.booking.model.BookingVO;
import com.sbss.crm.booking.model.CalendarParam;
import com.sbss.crm.booking.model.CalendarVO;

public interface BookingDao {
		
	/**
	 * 예약관리 목록 조회
	 * @param param
	 * @return
	 */
	public List<BookingVO> selectBookingList(BookingParam param);
	
	/**
	 * 예약관리 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectBookingTotalCount(BookingParam param);
	
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
	public int insertBookingInformation(BookingVO vo);
	
	/**
	 * 예약정보 수정
	 * @param vo
	 * @return
	 */
	public int updateBookingInformation(BookingVO vo);

	/**
	 * 예약현황 목록 조회
	 * @param param
	 * @return
	 */
	public List<CalendarVO> selectCalEventList(CalendarParam param);	

}
