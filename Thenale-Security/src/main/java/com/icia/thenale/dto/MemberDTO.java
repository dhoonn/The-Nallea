package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberDTO {
	private String m_id;
	private String m_k_id;
	private String m_n_id;
	private String m_g_id; 
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phone;
	private String m_profile;
	private String m_authority;
	private int m_permit;
	private int ENABLED;
	
	private MultipartFile mfile;
}
