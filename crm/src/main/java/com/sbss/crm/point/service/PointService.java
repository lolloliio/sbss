package com.sbss.crm.point.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.point.model.PointHistoryParam;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.model.PointVO;

public interface PointService {
	
	/**
	 * 포인트 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectPointList(PointParam param);
		
	/**
	 * 포인트 정보 조회
	 * @param param
	 * @return
	 */
	public PointVO selectPointInformation(PointParam param);
	
	/**
	 * 포인트 히스토리 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectPointHistoryList(PointHistoryParam param);
	
	/**
	 * 포인트 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertPointInformation(PointHistoryVO vo);
	
}
