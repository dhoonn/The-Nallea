package com.icia.thenale.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelRoomDTO;
import com.icia.thenale.dto.foodMenuDTO;
import com.icia.thenale.service.HotelService;

@Controller
public class HotelController {
	@Autowired
	private HotelService hService;
	private ModelAndView mav;

	// 호텔메인 화면 출력
	@RequestMapping(value = "/hotelmain")
	public String hotelmain() {
		return "companyv/hotelmain";
	}
	
	// 호텔 지역 선택
	@RequestMapping(value = "/hotelareaselect")
	public ModelAndView hotelareaselect(@RequestParam("h_area") String h_area) {
		mav = hService.hotelareaselect(h_area);
		return mav;
	}

	// 호텔 자세히 보기
	@RequestMapping(value = "/hotelview")
	public ModelAndView hotelView(@RequestParam("h_num") int h_num) {
		mav = hService.hotelView(h_num);
		return mav;
	}

	// 호텔 객실 추가 화면 띄우기
	@RequestMapping(value = "/addroom")
	public ModelAndView addroom(@RequestParam("h_c_id") String h_c_id) {
		mav = hService.addroom(h_c_id);
		return mav;
	}

	// 호텔 객실 추가
	@RequestMapping(value = "/hotelroomadd")
	public ModelAndView hotelroomadd(@ModelAttribute HotelRoomDTO hotelRoom) throws IllegalStateException, IOException {
		mav = hService.hotelroomadd(hotelRoom);
		return mav;
	}
}
