package com.sbss.crm.giftcard.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.giftcard.model.GiftcardHistoryParam;
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;
import com.sbss.crm.giftcard.model.GiftcardVO;

public interface GiftcardService {
	
	/**
	 * 기프트카드 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectGiftcardList(GiftcardParam param);
	
	/**
	 * 기프트카드 정보 조회
	 * @param param
	 * @return
	 */
	public GiftcardVO selectGiftcardInformation(GiftcardParam param);
	
	/**
	 * 기프트카드 히스토리 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectGiftcardHistoryList(GiftcardHistoryParam param);
	
	/**
	 * 포인트카드 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertGiftcardInformation(GiftcardHistoryVO vo);
		
}
