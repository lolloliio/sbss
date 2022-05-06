package com.sbss.crm.employee.dao;

import java.util.List;

import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;

public interface EmployeeDao {
	
	/**
	 * 직원 목록 조회
	 * @param param
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeList(EmployeeParam param);
	
	/**
	 * 전체 직원 개수 조회
	 * @param param
	 * @return
	 */
	public int selectEmployeeTotalCount(EmployeeParam param);
	
	/**
	 * 직원 목록 조회
	 * @param param
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeCodeList(EmployeeParam param);
	
	/**
	 * 직원 정보 조회
	 * @param param
	 * @return
	 */
	public EmployeeVO selectEmployeeInformation(EmployeeParam param);
	
	/**
	 * 직원 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertEmployeeInformation(EmployeeVO vo);
	
	/**
	 * 직원 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateEmployeeInformation(EmployeeVO vo);

}
