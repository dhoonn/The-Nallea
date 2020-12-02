package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class FoodReviewDTO {
	private int f_num;
	private int f_r_num;
	private String f_r_m_id;
	private String f_r_title;
	private String f_r_photo;
	private String f_r_contents;

	private MultipartFile frfile;
}
