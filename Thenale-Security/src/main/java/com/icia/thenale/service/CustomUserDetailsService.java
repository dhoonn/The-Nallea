package com.icia.thenale.service;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.icia.thenale.dao.UserAuthDAO;
import com.icia.thenale.dto.CustomUserDetails;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserAuthDAO userAuthDAO;
	@Autowired
	private HttpSession session;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("userservice111 : "+username);
		CustomUserDetails user = userAuthDAO.getUserById(username);
		System.out.println("userservice222 : "+user);
		System.out.println("userservice333 : "+username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}

}