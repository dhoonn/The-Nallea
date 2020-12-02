package com.icia.thenale.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
	
//	private String ID;
//	private String PASSWORD;
//	private String AUTHORITY;
//	private boolean ENABLED;
//	private String NAME;
	
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
//		auth.add(new SimpleGrantedAuthority(AUTHORITY));
//		return auth;
//	}
//
//	@Override
//	public String getPassword() {
//		return PASSWORD;
//	}
//
//	@Override
//	public String getUsername() {
//		return ID;
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		return true;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		return true;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		return ENABLED;
//	}
//	
//	public String getName() {
//		return NAME;
//	}
//
//	public void setNAME(String name) {
//		name = NAME;
//	}
	
	private String m_id;
	private String m_password;
	private String m_authority;
	private boolean ENABLED;
	private String m_name;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(m_authority));
		System.out.println("auth : "+auth);
		return auth;
	}

	@Override
	public String getPassword() {
		return m_password;
	}

	@Override
	public String getUsername() {
		return m_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}
	
	public String getName() {
		return m_name;
	}

	public void setNAME(String name) {
		name = m_name;
	}
}