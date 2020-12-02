package com.icia.thenale.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HotelRoomDTO {
	private int h_num;
	   private String h_title;
	   private String h_detail;
	   private int h_person;
	   private int h_price;
	   private String h_hotelimg;
	   private int h_book;
	   
	   private MultipartFile hrfile;
}
