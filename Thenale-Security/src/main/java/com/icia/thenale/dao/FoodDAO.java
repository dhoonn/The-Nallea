package com.icia.thenale.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.dto.foodMenuDTO;

@Repository
public class FoodDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 식당업체 승인 및 식당 DB에 데이터 이동
	public int foodAdd(CompanyDTO company) {
		return sql.insert("Food.foodAdd", company);
	}

	// 식당 리스트 출력
	public List<FoodDTO> foodList(String f_area) {
		return sql.selectList("Food.foodList", f_area);
	}

	// 식당 상세 조회 (관리자)
	public FoodDTO foodview(int f_num) {
		return sql.selectOne("Food.foodview_admin", f_num);
	}

	// 식당 상세 조회 (업주)
	public FoodDTO foodview(String f_c_id) {
		return sql.selectOne("Food.foodview_owner", f_c_id);
	}

	// 식당 리뷰 작성
	public int freviewwrite(FoodReviewDTO fReview) {
		return sql.insert("Food.fReviewwrite", fReview);
	}

	// 식당 리뷰 리스트
	public List<FoodReviewDTO> fRevieList(int f_num) {
		return sql.selectList("Food.fReviewList", f_num);
	}

	// 식당 리뷰 출력
	public List<FoodReviewDTO> fReviewview(int f_num) {
		return sql.selectList("Food.fReviewView", f_num);
	}

	public int foodmenuadd(foodMenuDTO foodMenu) {
		return sql.insert("Food.foodmenuadd", foodMenu);

	}

	public int addmenu(String f_c_id) {
		return sql.selectOne("Food.addmenusel", f_c_id);
	}

	/*
	 * public int addMenu(String f_c_id) { return sql.selectOne("Food.foodmenuform",
	 * f_c_id); }
	 */

	// 식당 메뉴 추가
	/*
	 * public int addMenu(int f_num) { return sql.insert("Food.addmenu", f_num); }
	 */

}
