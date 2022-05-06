package com.sbss.crm.common.resolver;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.sbss.crm.main.model.LoginVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);
	
	@Autowired
	public UserDetailsService userDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String username = authentication.getName();
		String password = authentication.getCredentials().toString();
		
		LoginVO user = (LoginVO) userDetailsService.loadUserByUsername(username);
		
		logger.debug("AuthenticationProvider user enabled ? ::::::" + user.isEnabled());
		
		if(!user.isEnabled() || !user.isCredentialsNonExpired()) {
			logger.debug("isEnabled or isCredentialsNonExpired :::::::: false!");
			throw new AuthenticationCredentialsNotFoundException(username);
		}
		
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
		logger.debug("AuthenticationProvider loadUserByUsername ::::::");
		
		if(!passwordEncoder.matches(password, user.getPassword())) {
			logger.debug("matchPassword :::::::: false!");
			throw new BadCredentialsException(username);
		}
		
		logger.debug("matchPassword :::::::: true!");
		
		return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
