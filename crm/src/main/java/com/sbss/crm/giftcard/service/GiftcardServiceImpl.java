package com.sbss.crm.giftcard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.giftcard.dao.GiftcardDao;
import com.sbss.crm.giftcard.model.GiftcardHistoryParam;
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;
import com.sbss.crm.giftcard.model.GiftcardVO;
import com.sbss.crm.payment.dao.PaymentDao;
import com.sbss.crm.payment.model.PaymentVO;

@Service
public class GiftcardServiceImpl implements GiftcardService {
	
	private static final Logger logger = LoggerFactory.getLogger(GiftcardServiceImpl.class);

	@Autowired
	GiftcardDao giftcardDao;

	@Autowired
	PaymentDao paymentDao;
	
	@Override
	public WrapperVO selectGiftcardList(GiftcardParam param) {
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<GiftcardVO> list = giftcardDao.selectGiftcardList(param);
		int totalCount = giftcardDao.selectGiftcardTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public GiftcardVO selectGiftcardInformation(GiftcardParam param) {
		return giftcardDao.selectGiftcardInformation(param);
	}
	
	@Override
	public WrapperVO selectGiftcardHistoryList(GiftcardHistoryParam param) {
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<GiftcardHistoryVO> list = giftcardDao.selectGiftcardHistoryList(param);
		int totalCount = giftcardDao.selectGiftcardHistoryTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;		
	}

	@Override
	@Transactional(rollbackFor={Exception.class})
	public ResultVO insertGiftcardInformation(GiftcardHistoryVO vo) {
		ResultVO result = new ResultVO();
		
		//기프트카드 정보 조회
		GiftcardParam giftParam = new GiftcardParam();
		giftParam.setCustomerId(vo.getCustomerId());
		GiftcardVO customerGiftVO = giftcardDao.selectGiftcardInformation(giftParam);
		
		try {
			int totalAmount = 0;
			GiftcardVO giftVO = new GiftcardVO();
			giftVO.setCustomerId(vo.getCustomerId());
			giftVO.setEmployeeId(vo.getEmployeeId());
			
			//기프트카드 메인정보 저장 및 수정
			int giftcardId = 0;
			if(customerGiftVO != null) {
				totalAmount = customerGiftVO.getGiftcardAmount();	
				giftVO.setGiftcardAmount(totalAmount + vo.getEarnAmount());
				giftcardDao.updateGiftcardInformation(giftVO);
				giftcardId = vo.getGiftcardId();
			}else {
				giftVO.setGiftcardAmount(totalAmount + vo.getEarnAmount());
				giftcardId = giftcardDao.insertGiftcardInformation(giftVO);
			}
			
			//지불정보 저장
			PaymentVO paymentVO = new PaymentVO();
			paymentVO.setPaymentType(vo.getPaymentType());
			paymentVO.setCard(vo.getCard());
			paymentVO.setCash(vo.getCash());
			paymentVO.setTransfer(vo.getTransfer());
			paymentVO.setPaymentDate(vo.getUseDate());
			paymentVO.setEmployeeId(vo.getEmployeeId());
			int paymentId = paymentDao.insertPaymentInformation(paymentVO);			
			
			//기프트카드 히스토리 저장
			vo.setGiftcardId(giftcardId);
			vo.setPaymentId(paymentId);
			vo.setTotalAmount(totalAmount + vo.getEarnAmount());
			giftcardDao.insertGiftcardHistoryInformation(vo);
			
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertGiftcardInformation error : " + e.toString());
			throw new RuntimeException(e);
		}
		return result;
	}


}
