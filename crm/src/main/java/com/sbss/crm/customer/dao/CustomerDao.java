package com.sbss.crm.customer.dao;

import java.util.List;

import com.sbss.crm.customer.model.CustomerParam;
import com.sbss.crm.customer.model.CustomerVO;

public interface CustomerDao {
	
	/**
	 * 고객 목록 조회
	 * @param param
	 * @return
	 */
	public List<CustomerVO> selectCustomerList(CustomerParam param);
	
	/**
	 * 회원 전체 개수 조회
	 * @param param
	 * @return
	 */
	public int selectCustomerTotalCount(CustomerParam param);
	
	/**
	 * 고객 정보 조회(1건)
	 * @param param
	 * @return
	 */
	public CustomerVO selectCustomerInformation(CustomerParam param);
	
	/**
	 * 가맹점 차트 번호 조회
	 * @param vo
	 * @return
	 */
	public int getFranchiseeChartId(CustomerVO vo);
	
	/**
	 * 고객 정보 저장
	 * @param vo
	 * @return
	 */
	public int insertCustomerInformation(CustomerVO vo);
	
	/**
	 * 고객 정보 수정
	 * @param vo
	 * @return
	 */
	public int updateCustomerInformation(CustomerVO vo);
	
	/**
	 * 고객 상세정보 조회
	 * @param vo
	 * @return
	 */
	public CustomerVO selectCustomerDetailInformation(CustomerParam param);
	
	/**
	 * 고객 상세정보 저장
	 * @param vo
	 * @return
	 */
	public int insertCustomerDetailInformation(CustomerVO vo);
	
	/**
	 * 고객 상세정보 수정
	 * @param vo
	 * @return
	 */
	public int updateCustomerDetailInformation(CustomerVO vo);	

}
