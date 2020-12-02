package com.icia.thenale.controller;

import java.io.IOException;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.icia.thenale.service.AirService;

@Controller
public class AirController {
	
	@Autowired
	private AirService aService;
	private ModelAndView mav;
	
	// 항공권 화면으로
	@RequestMapping(value = "/goAir")
	public String goAir() {
		return "member/air/airmain";
	}
	
//	@RequestMapping(value = "/goMap")
//	public String goMap() {
//		return "placeList_map";
//	}
	// 항공편 검색 작업(API)
		@RequestMapping(value = "/airsearch")
		public ModelAndView airSearch(@RequestParam("depAirportId") String depAirportId, @RequestParam("arrAirportId") String arrAirportId, @RequestParam("startDate") String startDate) throws IOException{
			mav = aService.airSearch(depAirportId, arrAirportId, startDate);
			return mav;
		}
		
	
}//class
