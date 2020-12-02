package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HotelDTO {
	private int h_num;
	private String h_c_id;
	private String h_name;
	private String h_contents;
	private String h_photo;
	private double h_x;
	private double h_y;
	private String h_area;
	private String h_address;
	private int h_hits;
	
	private MultipartFile hfile;
}
