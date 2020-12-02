package com.icia.thenale.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelRoomDTO;

@Repository
public class HotelDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 식당업체 승인 및 식당 DB에 데이터 이동
	public int hotelAddmission(CompanyDTO company) {
		return sql.insert("Hotel.hotelAdd", company);
	}

	// 호텔 리스트 출력
	public List<HotelDTO> hotelList(String h_area) {
		return sql.selectList("Hotel.hotelList", h_area);
	}

	// 호텔 자세히 보기
	public HotelDTO hotelView(int h_num) {
		return sql.selectOne("Hotel.hotelView", h_num);
	}

	public int addmenu(String h_c_id) {
		return sql.selectOne("Hotel.addroomsel", h_c_id);
	}

	// 호텔 room 정보 가져오기
	public List<HotelRoomDTO> hotelRoomView(int h_num) {
		return sql.selectList("Hotel.hotelRoomView", h_num);
	}

	public int hotelroomadd(HotelRoomDTO hotelRoom) {
		return sql.insert("Hotel.roomadd", hotelRoom);
	}

	// 호텔 페이지 클릭시 조회수
	public int hotelHits(int h_num) {
		return sql.update("Hotel.hotelHits", h_num);
	}

	// 페이징
	public int listcount() {
		return sql.selectOne("Hotel.hotelListCount");
	}

}
