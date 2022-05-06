package com.sbss.crm.employee.service;

import java.util.List;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;

public interface EmployeeService {
	
	/**
	 * 직원 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectEmployeeList(EmployeeParam param);
		
	/**
	 * 직원 정보 조회
	 * @param param
	 * @return
	 */
	public EmployeeVO selectEmployeeInformation(EmployeeParam param);
	
	/**
	 * 직원 목록 조회 (코드용)
	 * @param param
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeCodeList(EmployeeParam param);
	
	/**
	 * 직원 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertEmployeeInformation(EmployeeVO vo);
	
	/**
	 * 직원 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateEmployeeInformation(EmployeeVO vo);

}
