package com.sbss.crm.giftcard.dao;

import java.util.List;

import com.sbss.crm.giftcard.model.GiftcardHistoryParam;
import com.sbss.crm.giftcard.model.GiftcardHistoryVO;
import com.sbss.crm.giftcard.model.GiftcardParam;
import com.sbss.crm.giftcard.model.GiftcardVO;
import com.sbss.crm.point.model.PointVO;

public interface GiftcardDao {

	/**
	 * 기프트카드 목록 조회
	 * @param param
	 * @return
	 */
	public List<GiftcardVO> selectGiftcardList(GiftcardParam param);
	
	/**
	 * 기프트카드 전체 갯수 조회
	 * @param param
	 * @return
	 */
	public int selectGiftcardTotalCount(GiftcardParam param);
	
	/**
	 * 기프트카드 정보 조회
	 * @param param
	 * @return
	 */
	public GiftcardVO selectGiftcardInformation(GiftcardParam param);
	
	/**
	 * 기프트카드 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertGiftcardInformation(GiftcardVO vo);
	
	/**
	 * 기프트카드 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateGiftcardInformation(GiftcardVO vo);
	
	/**
	 * 기프트카드 히스토리 목록 조회
	 * @param param
	 * @return
	 */
	public List<GiftcardHistoryVO> selectGiftcardHistoryList(GiftcardHistoryParam param);
	
	/**
	 * 기프트카드 히스토리 전체 갯수 조회
	 * @param param
	 * @return
	 */
	public int selectGiftcardHistoryTotalCount(GiftcardHistoryParam param);
	
	/**
	 * 기프트카드 히스토리 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertGiftcardHistoryInformation(GiftcardHistoryVO vo);
	
}
