package com.sbss.crm.employee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.employee.model.EmployeeParam;
import com.sbss.crm.employee.model.EmployeeVO;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    @Autowired
    protected SqlSessionTemplate sqlSession;
	
	@Override
	public List<EmployeeVO> selectEmployeeList(EmployeeParam param) {
		return sqlSession.selectList("Employee.selectEmployeeList", param);
	}

	@Override
	public int selectEmployeeTotalCount(EmployeeParam param) {
		return sqlSession.selectOne("Employee.selectEmployeeTotalCount", param);
	}
	
	@Override
	public List<EmployeeVO> selectEmployeeCodeList(EmployeeParam param) {
		return sqlSession.selectList("Employee.selectEmployeeCodeList", param);
	}

	@Override
	public EmployeeVO selectEmployeeInformation(EmployeeParam param) {
		return sqlSession.selectOne("Employee.selectEmployeeInformation", param);
	}

	@Override
	public int insertEmployeeInformation(EmployeeVO vo) {
		return sqlSession.insert("Employee.insertEmployeeInformation", vo);
	}

	@Override
	public int updateEmployeeInformation(EmployeeVO vo) {
		return sqlSession.update("Employee.updateEmployeeInformation", vo);
	}

}
