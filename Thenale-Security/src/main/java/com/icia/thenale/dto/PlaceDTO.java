package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlaceDTO {
	private String p_name;
	private String p_a_name;
	private int p_type_num;
	private int p_with_num;
	private String p_photo;
	private double p_x;
	private double p_y;
	private String p_contents;
	
	private MultipartFile pfile;
}
