package com.sbss.crm.payment.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.payment.model.PaymentVO;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	protected SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPaymentInformation(PaymentVO vo) {
		sqlSession.insert("Payment.insertPaymentInformation", vo);
		return vo.getPaymentId(); 
	}

}
