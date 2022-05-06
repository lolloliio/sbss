package com.sbss.crm.booking.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.booking.dao.BookingDao;
import com.sbss.crm.booking.model.BookingParam;
import com.sbss.crm.booking.model.BookingVO;
import com.sbss.crm.booking.model.CalendarParam;
import com.sbss.crm.booking.model.CalendarVO;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;

@Service
public class BookingServiceImpl implements BookingService {
	
	private static final Logger logger = LoggerFactory.getLogger(BookingServiceImpl.class);

	@Autowired
	BookingDao bookingDao;
	
	@Override
	public WrapperVO selectBookingList(BookingParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<BookingVO> list = bookingDao.selectBookingList(param);
		int totalCount = bookingDao.selectBookingTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;		
	}
	
	@Override
	public BookingVO selectBookingInformation(BookingParam param) {
		return bookingDao.selectBookingInformation(param);
	}

	@Override
	public ResultVO insertBookingInformation(BookingVO vo) {
		ResultVO result = new ResultVO();
		try {
			bookingDao.insertBookingInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertBookingInformation error : " + e.toString());
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public ResultVO updateBookingInformation(BookingVO vo) {
		ResultVO result = new ResultVO();
		try {
			bookingDao.updateBookingInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateBookingInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public List<CalendarVO> selectCalEventList(CalendarParam param) {
		return bookingDao.selectCalEventList(param);
	}

}
