package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class FoodDTO {
	private int f_num;
	private String f_c_id;
	private String f_name;
	private String f_contents;
	private String f_photo;
	private double f_x;
	private double f_y;
	private String f_area;
	private String f_address;
	private int f_hits;
	
	private MultipartFile ffile;
}
