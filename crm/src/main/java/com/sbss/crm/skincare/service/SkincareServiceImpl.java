package com.sbss.crm.skincare.service;

import java.text.SimpleDateFormat;
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
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;
import com.sbss.crm.giftcard.model.GiftcardVO;
import com.sbss.crm.payment.dao.PaymentDao;
import com.sbss.crm.payment.model.PaymentVO;
import com.sbss.crm.point.dao.PointDao;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.model.PointVO;
import com.sbss.crm.skincare.dao.SkincareDao;
import com.sbss.crm.skincare.model.SkincareDetailVO;
import com.sbss.crm.skincare.model.SkincareOptionVO;
import com.sbss.crm.skincare.model.SkincareParam;
import com.sbss.crm.skincare.model.SkincareVO;

@Service
public class SkincareServiceImpl implements SkincareService {
	
	private static final Logger logger = LoggerFactory.getLogger(SkincareServiceImpl.class);

	@Autowired
	SkincareDao skincareDao;
	
	@Autowired
	PaymentDao paymentDao;
	
	@Autowired
	PointDao pointDao;
	
	@Autowired
	GiftcardDao giftcardDao;
	
	@Override
	public WrapperVO selectSkincareList(SkincareParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<SkincareVO> list = skincareDao.selectSkincareList(param);
		int totalCount = skincareDao.selectSkincareTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}
	
	@Override
	public SkincareVO selectSkincareInformation(SkincareParam param) {
		return skincareDao.selectSkincareInformation(param);
	}

	@Override
	@Transactional
	public ResultVO insertSkincareInformation(SkincareVO vo) {
		ResultVO result = new ResultVO();
		try {			
			//피부관리 메인 테이블 저장
			int skincareId = skincareDao.insertSkincareInformation(vo);

			//지불정보 저장
			PaymentVO paymentVO = new PaymentVO();
			paymentVO.setPaymentType("PMT0001");
			paymentVO.setCash(vo.getCash());
			paymentVO.setCard(vo.getCard());
			paymentVO.setTransfer(vo.getTransfer());
			paymentVO.setReceivables(vo.getReceivables());
			paymentVO.setDiscount(vo.getDiscount());
			paymentVO.setUsePoint(vo.getUsePoint());
			paymentVO.setUseGiftcard(vo.getUseGiftcard());
			paymentVO.setAmountPayment(vo.getAmountPayment());
			int paymentId = paymentDao.insertPaymentInformation(paymentVO);
			
			//포인트 사용 저장
			if(vo.getUsePoint() > 0){
				
				//포인트 정보 조회
				PointParam pointParam = new PointParam();
				pointParam.setCustomerId(vo.getCustomerId());
				PointVO customerPointVO = pointDao.selectPointInformation(pointParam);
				
				if(customerPointVO != null && customerPointVO.getPointAmount() > 0) {
					int pointId = customerPointVO.getPointId();
					int totalPoint = customerPointVO.getPointAmount();
					int remainPoint = totalPoint - vo.getUsePoint();
					
					PointVO pointVO = new PointVO();
					pointVO.setCustomerId(vo.getCustomerId());
					pointVO.setPointAmount(remainPoint);					
					pointDao.updatePointInformation(pointVO);
				
					SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
					String currentTime = dateFormat.format (System.currentTimeMillis());
					
					PointHistoryVO phVO = new PointHistoryVO();
					phVO.setPointId(pointId);
					phVO.setEarnPoint(0);
					phVO.setUsePoint(vo.getUsePoint());
					phVO.setTotalPoint(remainPoint);
					phVO.setUseDate(currentTime);
					//phVO.setMemo(memo);
					phVO.setEmployeeId(vo.getEmployeeId());
					pointDao.insertPointHistoryInformation(phVO);
				}
			}
			
			//기프트 카드 사용 저장
			if(vo.getUseGiftcard() > 0){
				GiftcardParam giftParam = new GiftcardParam();
				giftParam.setCustomerId(vo.getCustomerId());
				GiftcardVO giftCardInfo = giftcardDao.selectGiftcardInformation(giftParam);
				
				if(giftCardInfo != null && giftCardInfo.getGiftcardAmount() > 0){

					int totalGiftcard = giftCardInfo.getGiftcardAmount();
					int remainGiftcard = totalGiftcard - vo.getUseGiftcard();
					
					GiftcardVO giftVO = new GiftcardVO();
					giftVO.setCustomerId(vo.getCustomerId());
					giftVO.setGiftcardAmount(remainGiftcard);
					giftVO.setEmployeeId(vo.getEmployeeId());
					giftcardDao.updateGiftcardInformation(giftVO);
					
					SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
					String currentTime = dateFormat.format (System.currentTimeMillis());
					
					GiftcardHistoryVO giftHistVO = new GiftcardHistoryVO();
					giftHistVO.setEarnAmount(0);
					giftHistVO.setUseAmount(vo.getUseGiftcard());
					giftHistVO.setTotalAmount(remainGiftcard);
					//giftHistVO.setMemo(memo);
					giftHistVO.setUseDate(currentTime);
					giftHistVO.setPaymentId(paymentId);
					giftHistVO.setEmployeeId(vo.getEmployeeId());
					giftcardDao.insertGiftcardHistoryInformation(giftHistVO);
				}
			}
			
			//피부관리 상세 테이블 저장
			SkincareDetailVO detailVO = new SkincareDetailVO();
			detailVO.setSkincareId(skincareId);
			detailVO.setCycle(vo.getCurrntCycle());
			detailVO.setManageDate(vo.getManageDate());
			detailVO.setMemo(vo.getMemo());
			detailVO.setPaymentId(paymentId);
			detailVO.setEmployeeId(vo.getManageEmployeeId());
			int skincareDetailId = skincareDao.insertSkincareDetail(detailVO);
			
			//피부관리 옵션 정보 저장 
			for(int i=0; i<vo.getProgramOptionId().size(); i++){
				SkincareOptionVO optionVO = new SkincareOptionVO();
				optionVO.setSkincareDetailId(skincareDetailId);
				optionVO.setProgramOptionId(vo.getProgramOptionId().get(i));
				optionVO.setCycle(vo.getOptionCycle().get(i));
				optionVO.setPrice(vo.getOptionPrice().get(i));
				optionVO.setEmployeeId(vo.getEmployeeId());
			}
			result.setResult("success");
		} catch(Exception e) {
			logger.info("insertSkincareInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public ResultVO updateSkincareInformation(SkincareVO vo) {
		ResultVO result = new ResultVO();
		try {
			skincareDao.updateSkincareInformation(vo);
			result.setResult("success");
		} catch(Exception e) {
			logger.info("updateSkincareInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public WrapperVO selectCustomerCareList(SkincareParam param) {

		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<SkincareVO> list = skincareDao.selectSkincareList(param);
		int totalCount = skincareDao.selectSkincareTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;		
	}

}
