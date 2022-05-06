package com.sbss.crm.point.dao;

import java.util.List;

import com.sbss.crm.point.model.PointHistoryParam;
import com.sbss.crm.point.model.PointHistoryVO;
import com.sbss.crm.point.model.PointParam;
import com.sbss.crm.point.model.PointVO;

public interface PointDao {
	
	/**
	 * 포인트 목록 조회
	 * @param param
	 * @return
	 */
	public List<PointVO> selectPointList(PointParam param);
	
	/**
	 * 포인트 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectPointTotalCount(PointParam param);
	
	/**
	 * 포인트 정보 조회
	 * @param param
	 * @return
	 */
	public PointVO selectPointInformation(PointParam param);
	
	/**
	 * 포인트 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertPointInformation(PointVO vo);
	
	/**
	 * 포인트 정보 수정
	 * @param vo
	 * @return
	 */
	public int updatePointInformation(PointVO vo);
	
	/**
	 * 포인트 히스토리 목록 조회
	 * @param param
	 * @return
	 */
	public List<PointHistoryVO> selectPointHistoryList(PointHistoryParam param);

	/**
	 * 포인트 히스토리 전체 갯수 조회
	 * @param param
	 * @return
	 */
	public int selectPointHistoryTotalCount(PointHistoryParam param);
	
	/**
	 * 포인트 히스토리 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertPointHistoryInformation(PointHistoryVO vo);

}
