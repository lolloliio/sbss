package com.sbss.crm.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sbss.crm.main.dao.LoginDao;
import com.sbss.crm.main.model.LoginVO;

@Service(value="userDetailServiceImpl")
public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
    LoginDao userDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LoginVO user = userDao.getUserById(username);
		if(null == user) {
			throw new UsernameNotFoundException("User Not Found");
		}
		return user;
	}

}
