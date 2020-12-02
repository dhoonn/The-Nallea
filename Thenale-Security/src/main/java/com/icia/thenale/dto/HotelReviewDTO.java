package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class HotelReviewDTO {
	private int h_num;
	private int h_r_num;
	private String h_r_writer;
	private String h_r_title;
	private String h_r_photo;
	private String h_r_contents;

	private MultipartFile hfile;
}
