package com.sbss.crm.skincare.dao;

import java.util.List;

import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.skincare.model.SkincareDetailVO;
import com.sbss.crm.skincare.model.SkincareOptionVO;
import com.sbss.crm.skincare.model.SkincareParam;
import com.sbss.crm.skincare.model.SkincareVO;

public interface SkincareDao {
	
	/**
	 * 피부관리 목록 조회
	 * @param param
	 * @return
	 */
	public List<SkincareVO> selectSkincareList(SkincareParam param);

	/**
	 * 피부관리 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectSkincareTotalCount(SkincareParam param);
	
	/**
	 * 피부관리 정보 조회
	 * @param param
	 * @return
	 */
	public SkincareVO selectSkincareInformation(SkincareParam param);
	
	/**
	 * 피부관리 정보 수정
	 * @param vo
	 * @return
	 */
	public int insertSkincareInformation(SkincareVO vo);
	
	/**
	 * 피부관리 정보 저장
	 * @param vo
	 * @return
	 */
	public int updateSkincareInformation(SkincareVO vo);
	
	/**
	 * 피부관리 상세 정보 저장
	 * @param detailVO
	 * @return
	 */
	public int insertSkincareDetail(SkincareDetailVO detailVO);
	
	/**
	 * 피부관리 옵션 정보 저장
	 * @param optionVO
	 * @return
	 */
	public int insertSkincareOption(SkincareOptionVO optionVO);
	
}
