package com.sbss.crm.skincare.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.skincare.model.SkincareParam;
import com.sbss.crm.skincare.model.SkincareVO;

public interface SkincareService {
	
	/**
	 * 피부관리 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectSkincareList(SkincareParam param);
		
	/**
	 * 피부관리 상세 조회
	 * @param param
	 * @return
	 */
	public SkincareVO selectSkincareInformation(SkincareParam param);
	
	/**
	 * 피부관리 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertSkincareInformation(SkincareVO vo);
	
	/**
	 * 피부관리 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateSkincareInformation(SkincareVO vo);

	/**
	 * 피부관리 고객 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectCustomerCareList(SkincareParam param);

}
