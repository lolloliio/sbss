package com.sbss.crm.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sbss.crm.main.model.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao {
	
    @Autowired
    protected SqlSessionTemplate sqlSession;

	@Override
	public LoginVO getUserById(String username) {
		return sqlSession.selectOne("Login.getUserById", username);
	}

}
