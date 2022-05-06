package com.sbss.crm.payment.dao;

import com.sbss.crm.payment.model.PaymentVO;

public interface PaymentDao {
	
	/**
	 * 지불정보 저장
	 * @param vo
	 * @return
	 */
	public int insertPaymentInformation(PaymentVO vo);

}
