package com.sbss.crm.commonCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbss.crm.commonCode.dao.CommonCodeDao;
import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	CommonCodeDao commonCodeDao;
	
	@Override
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO vo) {
		return commonCodeDao.selectCommonCodeList(vo);
	}

	@Override
	public List<FranchiseeVO> selectFranchiseeList(FranchiseeParam param) {
		return commonCodeDao.selectFranchiseeList(param);
	}

	@Override
	public List<EmployeeVO> selectEmployeeList(EmployeeParam param) {
		return commonCodeDao.selectEmployeeList(param);
	}

}
