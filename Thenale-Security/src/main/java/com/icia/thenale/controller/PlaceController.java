package com.icia.thenale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.PlaceDTO;
import com.icia.thenale.service.MemberService;
import com.icia.thenale.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService pService;
	private ModelAndView mav;
	
		// 여행지 검색
		@RequestMapping(value = "/areasearch")
		public String areasearch() {
			return "placev/searchpage";
		}

		// 여행지 선택
		@RequestMapping(value = "/areaselect")
		public ModelAndView areaselect(@RequestParam("p_a_name") String p_a_name) {
			mav = pService.areaselect(p_a_name);
			return mav;
		}

		// 여행 타입 선택
		@RequestMapping(value = "/areachoice")
		public ModelAndView areachoice(@ModelAttribute PlaceDTO place) {
			mav = pService.areachoice(place);
			return mav;
		}
}
