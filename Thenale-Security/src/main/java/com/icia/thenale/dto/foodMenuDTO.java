package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class foodMenuDTO {
	private String f_m_f_num;
	private String f_m_name;
	private String f_m_price;
	private String f_m_foodimg;
	
	private MultipartFile f_m_file;
}
