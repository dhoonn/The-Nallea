package com.icia.thenale.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.foodMenuDTO;
import com.icia.thenale.service.FoodService;

@Controller
public class FoodController {
	@Autowired
	private FoodService fService;
	private ModelAndView mav;

	// 식당메인 화면 출력
	@RequestMapping(value = "/foodmain")
	public String foodmain() {
		return "companyv/foodmain";
	}

	// 식당 지역 선택
	@RequestMapping(value = "/foodareaselect")
	public ModelAndView foodareaselect(@RequestParam("f_area") String f_area) {
		mav = fService.foodareaselect(f_area);
		return mav;
	}

	// 식당 상세 조회
	@RequestMapping(value = "/foodview")
	public ModelAndView foodview(@RequestParam("f_num") int f_num) {
		mav = fService.foodview(f_num);
		return mav;
	}

	// 식당 메뉴 추가 화면 띄우기
	@RequestMapping(value = "/addmenu")
	public ModelAndView addmenu(@RequestParam("f_c_id") String f_c_id) {
		mav = fService.addmenu(f_c_id);
		return mav;
	}
	
	// 식당 메뉴 추가
	@RequestMapping(value = "/foodmenuadd")
	public ModelAndView foodmenuadd(@ModelAttribute foodMenuDTO foodMenu) throws IllegalStateException, IOException {
		mav = fService.foodmenuadd(foodMenu);
		return mav;
	}
}
