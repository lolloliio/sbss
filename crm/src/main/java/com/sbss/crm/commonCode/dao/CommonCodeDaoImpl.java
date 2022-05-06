package com.sbss.crm.commonCode.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.commonCode.model.CommonCodeVO;
import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;
import com.sbss.crm.franchisee.model.FranchiseeParam;
import com.sbss.crm.franchisee.model.FranchiseeVO;

@Repository
public class CommonCodeDaoImpl implements CommonCodeDao {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;

	@Override
	public List<CommonCodeVO> selectCommonCodeList(CommonCodeVO vo) {
		return sqlSession.selectList("CommonCode.selectCommonCodeList", vo);
	}

	@Override
	public List<FranchiseeVO> selectFranchiseeList(FranchiseeParam param) {
		return sqlSession.selectList("CommonCode.selectFranchiseeList", param);
	}

	@Override
	public List<EmployeeVO> selectEmployeeList(EmployeeParam param) {
		return sqlSession.selectList("CommonCode.selectEmployeeList", param);
	}
    
    

}
