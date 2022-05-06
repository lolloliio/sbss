package com.sbss.crm.commonCode.service;

import java.util.List;

import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

public interface CommonCodeService {
	
	/**
	 * 공통코드 목록 조회
	 * @param vo
	 * @return
	 */
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO vo);

	/**
	 * 가맹점 코드 목록 조회
	 * @param param
	 * @return
	 */
	public List<FranchiseeVO> selectFranchiseeList(FranchiseeParam param);
	
	/**
	 * 직원 코드 목록 조회
	 * @param param
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeList(EmployeeParam param);
}
