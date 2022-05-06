package com.sbss.crm.customer.service;

import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.customer.model.CustomerParam;
import com.sbss.crm.customer.model.CustomerVO;

public interface CustomerService {

	/**
	 * 고객 목록 조회
	 * @param param
	 * @return
	 */
	public WrapperVO selectCustomerList(CustomerParam param);
	
	/**
	 * 고객 정보 조회(1건)
	 * @param param
	 * @return
	 */
	public CustomerVO selectCustomerInformation(CustomerParam param);
	
	/**
	 * 고객 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertCustomerInformation(CustomerVO vo);
	
	/**
	 * 고객 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateCustomerInformation(CustomerVO vo);
	
	/**
	 * 고객 상세 정보 조회
	 * @param vo
	 * @return
	 */
	public CustomerVO selectCustomerDetailInformation(CustomerParam param);
	
	/**
	 * 고객 상세 정보 저장
	 * @param vo
	 * @return
	 */
	public ResultVO insertCustomerDetailInformation(CustomerVO vo);
	
	/**
	 * 고객 상세 정보 수정
	 * @param vo
	 * @return
	 */
	public ResultVO updateCustomerDetailInformation(CustomerVO vo);
	
}
