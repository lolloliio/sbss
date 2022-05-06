package com.sbss.crm.employee.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.google.common.base.CaseFormat;
import com.sbss.crm.common.model.ResultVO;
import com.sbss.crm.common.model.WrapperVO;
import com.sbss.crm.employee.dao.EmployeeDao;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Autowired
	EmployeeDao employeeDao;
	
	@Override
	public WrapperVO selectEmployeeList(EmployeeParam param) {
		
		//컬럼 번호를 컬럼명으로 변경
		if(!param.getOrder().isEmpty()) {
			for(int i=0; i<param.getOrder().size(); i++) {
				int columnNum = param.getOrder().get(i).getColumn();
				String columnName = param.getColumns().get(columnNum).getData();
				String replaceColumnName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, columnName);				
				param.getOrder().get(i).setColumnName(replaceColumnName);
			}
		}
		
		List<EmployeeVO> list = employeeDao.selectEmployeeList(param);
		int totalCount  = employeeDao.selectEmployeeTotalCount(param);
		
		WrapperVO wp = new WrapperVO();
		wp.setData(list);
		wp.setDraw(param.getDraw());
		wp.setRecordsTotal(totalCount);
		wp.setRecordsFiltered(totalCount);
		return wp;
	}

	@Override
	public List<EmployeeVO> selectEmployeeCodeList(EmployeeParam param) {
		return employeeDao.selectEmployeeCodeList(param);
	}

	@Override
	public EmployeeVO selectEmployeeInformation(EmployeeParam param) {
		return employeeDao.selectEmployeeInformation(param);
	}

	@Override
	public ResultVO insertEmployeeInformation(EmployeeVO vo) {
		ResultVO result = new ResultVO();
		try {
			BCryptPasswordEncoder en = new BCryptPasswordEncoder();
			String encPassword = en.encode(vo.getPassword());
			vo.setEncPassword(encPassword);
			employeeDao.insertEmployeeInformation(vo);
			result.setResult("success");
		} catch(Exception e) {
			logger.info("insertEmployeeInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result; 
	}

	@Override
	public ResultVO updateEmployeeInformation(EmployeeVO vo) {
		ResultVO result = new ResultVO();
		try{
			BCryptPasswordEncoder en = new BCryptPasswordEncoder();
			String encPassword = en.encode(vo.getPassword());
			vo.setEncPassword(encPassword);
			employeeDao.updateEmployeeInformation(vo);
			result.setResult("success");
		}catch(Exception e) {
			logger.info("updateEmployeeInformation error : " + e);
			throw new RuntimeException(e);
		}
		return result;
	}


}
