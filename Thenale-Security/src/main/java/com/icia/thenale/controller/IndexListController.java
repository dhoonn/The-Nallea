package com.icia.thenale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelReviewDTO;
import com.icia.thenale.dto.MemberDTO;
import com.icia.thenale.dto.PlaceDTO;
import com.icia.thenale.dto.ScheduleDTO;
import com.icia.thenale.service.HotelService;
import com.icia.thenale.service.IndexListService;

@Controller
public class IndexListController {

	@Autowired
	private IndexListService iService;
	private ModelAndView mav;

	// index 화면 불러오기
	@RequestMapping(value = "/")
	public ModelAndView indexList(@ModelAttribute HotelDTO hotel, FoodDTO food, PlaceDTO place) {
		mav = iService.indexList(hotel, food, place);
		return mav;
	}
	
	// 호텔 리스트 불러오기
	@RequestMapping(value = "/hotellist")
	public ModelAndView hotelList(@ModelAttribute HotelDTO hotel, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		mav = iService.hotelList(hotel, page);
		return mav;
	}
	
	// 식당 리스트 불러오기
	@RequestMapping(value = "/foodlist")
	public ModelAndView foodList(@ModelAttribute FoodDTO food) {
		mav = iService.foodList(food);
		return mav;
	}
	
	// 여행지 리스트 불러오기
	@RequestMapping(value = "/placelist")
	public ModelAndView placeList(@ModelAttribute PlaceDTO place) {
		mav = iService.placeList(place);
		return mav;
		}
	// 전체리스트 불러오기
	@RequestMapping(value = "/allplace")
	public ModelAndView allplace(@ModelAttribute ScheduleDTO sche, HotelDTO hotel, FoodDTO food, PlaceDTO place) {
		System.out.println("sche : " + sche);
		mav = iService.allplace(hotel, food, place, sche);
		return mav;
	}

	@RequestMapping(value = "/reviewmain")
	public ModelAndView reviewmain(@ModelAttribute FoodReviewDTO fReview, HotelReviewDTO hReview) {
		mav = iService.reviewmain(fReview, hReview);
		return mav;
	}

}
