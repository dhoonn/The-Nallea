package com.icia.thenale.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.PlaceDTO;
import com.icia.thenale.dto.ScheduleDTO;
import com.icia.thenale.service.MemberService;

@Controller
public class ScheduleController {
	
	@Autowired
	private MemberService mService;
	private ModelAndView mav;
	
	@RequestMapping(value = "/membersche")
		public ModelAndView dateinsert(@ModelAttribute ScheduleDTO sche) {
		System.out.println("sche : "+sche);
		System.out.println("카운트 : "+sche.getS_count());
		System.out.println("sche2 : "+sche);
		 String strStartDate = sche.getS_startdate();
	        String strEndDate = sche.getS_enddate();
	        String strFormat = "yyyy-MM-dd";    //strStartDate 와 strEndDate 의 format
	        
	        //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
	        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	        long diffDay = 0;
	        try{
	        	Date startDate = sdf.parse(strStartDate);
	        	Date endDate = sdf.parse(strEndDate);
	        	
	            //두날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
	            diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
	            System.out.println(diffDay*-1+1+"일");
	        }catch(ParseException e){
	            e.printStackTrace();
	        }
	        int day = Long.valueOf(diffDay).intValue();
	        sche.setS_count((day*-1)+1);
		mav =  mService.dateinsert(sche);
		return mav;
		}
}
