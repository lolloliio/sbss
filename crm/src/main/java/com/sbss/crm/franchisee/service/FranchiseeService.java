package com.sbss.crm.franchisee.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

public interface FranchiseeService {
	
	/**
	 * 가맹점 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectFranchiseeList(FranchiseeParam param);
		
	/**
	 * 가맹점 정보 조회
	 * @param param
	 * @return
	 */
	public FranchiseeVO selectFranchiseeInformation(FranchiseeParam param);
	
	/**
	 * 가맹점 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertFranchiseeInformation(FranchiseeVO vo);
	
	/**
	 * 가맹점 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateFranchiseeInformation(FranchiseeVO vo);

}
