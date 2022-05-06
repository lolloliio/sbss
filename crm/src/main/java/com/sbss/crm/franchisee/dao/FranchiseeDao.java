package com.sbss.crm.franchisee.dao;

import java.util.List;

import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;


public interface FranchiseeDao {

	/**
	 * 가맹점 목록 조회
	 * @param param
	 * @return
	 */
	public List<FranchiseeVO> selectFranchiseeList(FranchiseeParam param);
	
	/**
	 * 가맹점 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectFranchiseeTotalCount(FranchiseeParam param);
	
	/**
	 * 가맹점 정보 조회 (1건)
	 * @param param
	 * @return
	 */
	public FranchiseeVO selectFranchiseeInformation(FranchiseeParam param);
	
	/**
	 * 가맹점 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertFranchiseeInformation(FranchiseeVO vo);
	
	/**
	 * 가맹점 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateFranchiseeInformation(FranchiseeVO vo);
}
