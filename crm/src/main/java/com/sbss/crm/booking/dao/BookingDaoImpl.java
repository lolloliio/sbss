package com.sbss.crm.booking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.booking.model.BookingParam;
import com.sbss.crm.booking.model.BookingVO;
import com.sbss.crm.booking.model.CalendarParam;
import com.sbss.crm.booking.model.CalendarVO;

@Repository
public class BookingDaoImpl implements BookingDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<BookingVO> selectBookingList(BookingParam param) {
		return sqlSession.selectList("Booking.selectBookingList", param);
	}
	
	@Override
	public int selectBookingTotalCount(BookingParam param) {
		return sqlSession.selectOne("Booking.selectBookingTotalCount", param);
	}

	@Override
	public BookingVO selectBookingInformation(BookingParam param) {
		return sqlSession.selectOne("Booking.selectBookingInformation", param);
	}

	@Override
	public int insertBookingInformation(BookingVO vo) {
		return sqlSession.insert("Booking.insertBookingInformation", vo);
	}

	@Override
	public int updateBookingInformation(BookingVO vo) {
		return sqlSession.update("Booking.updateBookingInformation", vo);
	}

	@Override
	public List<CalendarVO> selectCalEventList(CalendarParam param) {
		return sqlSession.selectList("Booking.selectCalEventList", param);
	}

}
