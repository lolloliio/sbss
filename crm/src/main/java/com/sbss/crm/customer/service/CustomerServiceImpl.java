package com.sbss.crm.customer.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.customer.dao.CustomerDao;
import com.sbss.crm.customer.model.CustomerParam;
import com.sbss.crm.customer.model.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);

	@Autowired
	CustomerDao customerDao;
	
	@Override
	public WrapperVO selectCustomerList(CustomerParam param) {
		
		// 컬럼 번호를 컬럼명으로 변경
		if (!param.getOrder().isEmpty()) {
			for (int i = 0; i < param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}

		List<CustomerVO> list = customerDao.selectCustomerList(param);
		int totalCount = customerDao.selectCustomerTotalCount(param);

		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public CustomerVO selectCustomerInformation(CustomerParam param) {
		return customerDao.selectCustomerInformation(param);
	}

	@Override
	@Transactional	
	public ResultVO insertCustomerInformation(CustomerVO vo) {
		ResultVO result = new ResultVO();
		try {
			int chartId = customerDao.getFranchiseeChartId(vo);
			vo.setChartId(chartId);
			int customerId = customerDao.insertCustomerInformation(vo);
			vo.setCustomerId(customerId);
			customerDao.insertCustomerDetailInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertCustomerInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	@Transactional
	public ResultVO updateCustomerInformation(CustomerVO vo) {		
		ResultVO result = new ResultVO();
		try {
			customerDao.updateCustomerInformation(vo);
			
			CustomerParam param = new CustomerParam();
			param.setCustomerId(vo.getCustomerId());
			CustomerVO detailInfomation = customerDao.selectCustomerDetailInformation(param);
			
			if(detailInfomation != null) {
				customerDao.updateCustomerDetailInformation(vo);
			}else {
				customerDao.insertCustomerDetailInformation(vo);
			}
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateCustomerInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public CustomerVO selectCustomerDetailInformation(CustomerParam param) {
		return customerDao.selectCustomerDetailInformation(param);
	}

	@Override
	public ResultVO insertCustomerDetailInformation(CustomerVO vo) {
		ResultVO result = new ResultVO();
		try {
			customerDao.insertCustomerDetailInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertCustomerDetailInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result; 
	}

	@Override
	public ResultVO updateCustomerDetailInformation(CustomerVO vo) {
		ResultVO result = new ResultVO();
		try {
			customerDao.updateCustomerDetailInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateCustomerDetailInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

}
