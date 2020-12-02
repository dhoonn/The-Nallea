package com.icia.thenale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.HotelDAO;
import com.icia.thenale.dao.IndexListDAO;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelReviewDTO;
import com.icia.thenale.dto.PageDTO;
import com.icia.thenale.dto.PlaceDTO;
import com.icia.thenale.dto.ScheduleDTO;

@Service
public class IndexListService {

	@Autowired
	private IndexListDAO iDAO;

	@Autowired
	private HotelDAO hDAO;
	private ModelAndView mav;

	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 10;

	public ModelAndView indexList(HotelDTO hotel, FoodDTO food, PlaceDTO place) {
		mav = new ModelAndView();
		List<HotelDTO> hDTO = iDAO.hotelList();
		List<FoodDTO> fDTO = iDAO.foodList();
		List<PlaceDTO> pDTO = iDAO.placeList();
		mav.addObject("hDTO", hDTO);
		mav.addObject("fDTO", fDTO);
		mav.addObject("pDTO", pDTO);
		mav.setViewName("index");
		return mav;
	}

	public ModelAndView reviewmain(FoodReviewDTO fReview, HotelReviewDTO hReviewDTO) {
		mav = new ModelAndView();
		List<FoodReviewDTO> frList = iDAO.foodReviewList();
		List<HotelReviewDTO> hrList = iDAO.hotelReviewList();
		mav.addObject("frList", frList);
		mav.addObject("hrList", hrList);
		mav.setViewName("indexReview");
		return mav;
	}

	// 달력
	public ModelAndView calendar(HotelDTO hotel, FoodDTO food, PlaceDTO place) {
		mav = new ModelAndView();
		List<HotelDTO> hDTO = iDAO.hotelList();
		List<FoodDTO> fDTO = iDAO.foodList();
		List<PlaceDTO> pDTO = iDAO.placeList();
		mav.addObject("hDTO", hDTO);
		mav.addObject("fDTO", fDTO);
		mav.addObject("pDTO", pDTO);
		mav.setViewName("memberv/membercalendar");
		return mav;
	}

	// 전체 리스트 불러오기
	public ModelAndView allplace(HotelDTO hotel, FoodDTO food, PlaceDTO place, ScheduleDTO sche) {
		mav = new ModelAndView();
		List<HotelDTO> hDTO = iDAO.hotelList();
		List<FoodDTO> fDTO = iDAO.foodList();
		List<PlaceDTO> pDTO = iDAO.placeList();
		mav.addObject("sche", sche);
		mav.addObject("hDTO", hDTO);
		mav.addObject("fDTO", fDTO);
		mav.addObject("pDTO", pDTO);
		mav.setViewName("placev/allplacelist");
		return mav;
	}

	// 호텔
	public ModelAndView hotelList(HotelDTO hotel, int page) {
		mav = new ModelAndView();

		int listCount = hDAO.listcount();
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;

		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		List<HotelDTO> hDTO = iDAO.hotelListpaging(paging);

		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		mav.addObject("paging", paging);
		mav.addObject("hDTO", hDTO);
		mav.setViewName("hotelv/hotellist");
		return mav;
	}

	// 음식
	public ModelAndView foodList(FoodDTO food) {
		mav = new ModelAndView();
		List<FoodDTO> fDTO = iDAO.foodList();
		mav.addObject("fDTO", fDTO);
		mav.setViewName("foodv/foodlist");
		return mav;
	}

	// 장소
	public ModelAndView placeList(PlaceDTO place) {
		mav = new ModelAndView();
		List<PlaceDTO> pDTO = iDAO.placeList();
		mav.addObject("pDTO", pDTO);
		mav.setViewName("placev/placelist");
		return mav;
	}
}