package com.sbss.crm.franchisee.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.franchisee.dao.FranchiseeDao;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

@Service
public class FranchiseeServiceImpl implements FranchiseeService {
	
	private static final Logger logger = LoggerFactory.getLogger(FranchiseeServiceImpl.class);
	
	@Autowired
	FranchiseeDao franchiseeDao;

	@Override
	public WrapperVO selectFranchiseeList(FranchiseeParam param) {
		
		//컬럼 번호를 컬럼명으로 변경
		if(!param.getOrder().isEmpty()) {
			for(int i=0; i<param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();				
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);				
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}
		
		List<FranchiseeVO> list = franchiseeDao.selectFranchiseeList(param);
		int totalCount  = franchiseeDao.selectFranchiseeTotalCount(param);
		
		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}
	
	@Override
	public FranchiseeVO selectFranchiseeInformation(FranchiseeParam param) {
		return franchiseeDao.selectFranchiseeInformation(param);
	}

	@Override
	public ResultVO insertFranchiseeInformation(FranchiseeVO vo) {
		ResultVO result = new ResultVO();
		try {
			franchiseeDao.insertFranchiseeInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("insertFranchiseeInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public ResultVO updateFranchiseeInformation(FranchiseeVO vo) {
		ResultVO result = new ResultVO();
		try {
			franchiseeDao.updateFranchiseeInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateFranchiseeInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}

}
