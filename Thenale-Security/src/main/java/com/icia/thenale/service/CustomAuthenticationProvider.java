package com.icia.thenale.service;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.icia.thenale.dto.CustomUserDetails;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	Logger log = Logger.getLogger(getClass());
	
	@Autowired
	private UserDetailsService userDeSer;

	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		//화면에서 입력한 아이디를 username에 담는다, 화면에서 입력한 비밀번호를 password에 담는다.
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		log.debug("AuthenticationProvider :::::: 1");
		
		//화면에서 입력한 아이디(username)로 DB에 있는 사용자의 정보를 UserDetails 형으로 가져와 user에 담는다.
		CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(username);
		System.out.println("user : "+user);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
		
		log.debug("AuthenticationProvider loadUserByUsername :::::: 3");
		
		//화면에서 입력한 비밀번호와 DB에서 가져온 비밀번호를 비교하는 로직이다. 비밀번호가 맞지 않다면 예외를 던진다.
		if(!matchPassword(password, user.getPassword())) {
			log.debug("matchPassword :::::::: false!");
			throw new BadCredentialsException(username);
		}
		
		//계정 활성화 여부를 확인하는 로직이다. AuthenticationProvider 인터페이스를 구현하게 되면 계정 잠금 여부나 활성화 여부등은 여기에서 확인해야 한다.
		if(!user.isEnabled()) {
			log.debug("isEnabled :::::::: false!");
			throw new BadCredentialsException(username);
		}
		
		log.debug("matchPassword :::::::: true!");
		
		//계정이 인증됐다면 UsernamePasswordAuthenticationToken 객체에 화면에서 입력한 정보와 DB에서 가져온 권한을 담아서 리턴한다.
		return new UsernamePasswordAuthenticationToken(username, password, authorities);
	}

	
	//AuthenticationProvider 인터페이스가 지정된 Authentication 객체를 지원하는 경우에 true를 리턴한다.
	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
	
	//비밀번호를 비교하는 메서드이다. 맞으면 true를 리턴한다.
	private boolean matchPassword(String loginPwd, String password) {
		log.debug("matchPassword :::::::: check!");
		return loginPwd.equals(password);
	}

}