package com.sbss.crm.main.dao;

import com.sbss.crm.main.model.LoginVO;

public interface LoginDao {
	
	public LoginVO getUserById(String username);

}
