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
import com.icia.thenale.service.CompanyService;
import com.icia.thenale.service.FoodService;
import com.icia.thenale.service.HotelService;

@Controller
public class CompanyController {

	@Autowired
	private FoodService fService;
	@Autowired
	private HotelService hService;
	@Autowired
	private CompanyService cService;
	private ModelAndView mav;

	// 업체 회원가입 페이지 이동
	@RequestMapping(value = "/comjoin")
	public String comjoin() {
		return "companyv/companyjoin";
	}

	// 업체 회원 로그인 페이지 이동
	@RequestMapping(value = "/comlogin")
	public String comlogin() {
		return "companyv/companylogin";
	}

	// 업체 회원가입
	@RequestMapping(value = "/comjoinform")
	public ModelAndView companyJoin(@ModelAttribute CompanyDTO company) throws IllegalStateException, IOException {
		mav = cService.companyJoin(company);
		return mav;
	}

	// 업체 로그인
	@RequestMapping(value = "/companylogin")
	public ModelAndView companyLogin(@ModelAttribute CompanyDTO company, FoodDTO food, HotelDTO hotel,
			@RequestParam("c_id") String c_id) {
		mav = cService.companyLogin(company, c_id);
		return mav;
	}

	// admin 관리자 페이지
	@RequestMapping(value = "/manager")
	public ModelAndView CompanyList(@ModelAttribute CompanyDTO company) {
		mav = cService.companyList(company);
		return mav;
	}

	// 업체 신청서 상세조회
	@RequestMapping(value = "/companyview")
	public ModelAndView companyView(@RequestParam("c_id") String c_id) {
		mav = cService.companyView(c_id);
		return mav;
	}

	// 업체 신청 승인
	@RequestMapping(value = "/admission")
	public ModelAndView companyAdminssion(@ModelAttribute CompanyDTO company) {
		String sort = company.getC_sort();
		if (sort.equals("식당")) {
			mav = fService.foodAddmission(company);
		} else if (sort.equals("숙박")) {
			mav = hService.hotelAddmission(company);
		}
		mav = cService.companyAdminssion(company);
		return mav;
	}

	// 업체 삭제
	@RequestMapping(value = "/companyDelete")
	public ModelAndView companyDelete(@RequestParam(value = "c_id", required = false) String c_id) {
		mav = cService.companyDelete(c_id);
		return mav;
	}

}