package com.icia.thenale.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelReviewDTO;
import com.icia.thenale.dto.PageDTO;
import com.icia.thenale.dto.PlaceDTO;

@Repository
public class IndexListDAO {

	@Autowired
	private SqlSessionTemplate sql;

	/*
	 * public List<HotelDTO> hotelList(paging) { return
	 * sql.selectList("IndexList.hotelList"); }
	 */

	public List<HotelDTO> hotelList() {
		return sql.selectList("IndexList.hotelList");
	}

	public List<FoodDTO> foodList() {
		return sql.selectList("IndexList.foodList");
	}

	public List<PlaceDTO> placeList() {
		return sql.selectList("IndexList.placeList");
	}

	public List<FoodReviewDTO> foodReviewList() {
		return sql.selectList("IndexList.foodReviewList");
	}

	public List<HotelReviewDTO> hotelReviewList() {
		return sql.selectList("IndexList.hotelReviewList");
	}

	public List<HotelDTO> hotelListpaging(PageDTO paging) {
		return sql.selectList("IndexList.hotelListPaging", paging);
	}

}
