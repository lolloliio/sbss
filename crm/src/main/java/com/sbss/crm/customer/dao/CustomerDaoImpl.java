package com.sbss.crm.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.customer.model.CustomerParam;
import com.sbss.crm.customer.model.CustomerVO;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;

	@Override
	public List<CustomerVO> selectCustomerList(CustomerParam param) {
		return sqlSession.selectList("Customer.selectCustomerList", param);
	}
	
	@Override
	public int selectCustomerTotalCount(CustomerParam param) {
		return sqlSession.selectOne("Customer.selectCustomerTotalCount", param);
	}

	@Override
	public CustomerVO selectCustomerInformation(CustomerParam param) {
		return sqlSession.selectOne("Customer.selectCustomerInformation", param);
	}
	
	@Override
	public int getFranchiseeChartId(CustomerVO vo) {
		return sqlSession.selectOne("Customer.getFranchiseeChartId", vo);
	}

	@Override
	public int insertCustomerInformation(CustomerVO vo) {
		sqlSession.insert("Customer.insertCustomerInformation", vo);		
		return vo.getCustomerId();
	}

	@Override
	public int updateCustomerInformation(CustomerVO vo) {
		return sqlSession.update("Customer.updateCustomerInformation", vo);
	}
	
	@Override
	public CustomerVO selectCustomerDetailInformation(CustomerParam param) {
		return sqlSession.selectOne("Customer.selectCustomerDetailInformation", param);
	}

	@Override
	public int insertCustomerDetailInformation(CustomerVO vo) {
		return sqlSession.insert("Customer.insertCustomerDetailInformation", vo);
	}

	@Override
	public int updateCustomerDetailInformation(CustomerVO vo) {
		return sqlSession.update("Customer.updateCustomerDetailInformation", vo);
	}

}
