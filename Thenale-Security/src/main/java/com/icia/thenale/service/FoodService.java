package com.icia.thenale.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.FoodDAO;
import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.dto.foodMenuDTO;

@Service
public class FoodService {

	@Autowired
	private FoodDAO fDAO;
	private ModelAndView mav;

	// 식당 권한 부여 및 정보 넘겨주기
	public ModelAndView foodAddmission(CompanyDTO company) {
		mav = new ModelAndView();
		int foodAddmitionResult = fDAO.foodAdd(company);
		if (foodAddmitionResult > 0) {
			mav.setViewName("company/companyv/companyview");
		} else {
			mav.setViewName("fail");
		}
		return mav;
	}

	// 식당 리스트 츨력
	public ModelAndView foodareaselect(String f_area) {
		mav = new ModelAndView();
		List<FoodDTO> fList = new ArrayList<FoodDTO>();

		fList = fDAO.foodList(f_area);
		mav.addObject("fList", fList);
		mav.setViewName("guest/foodv/foodList");
		return mav;
	}

	// 식당 상세조회
	public ModelAndView foodview(int f_num) {
		mav = new ModelAndView();
		FoodDTO fDTO = fDAO.foodview(f_num);

		List<FoodReviewDTO> fReviewview = fDAO.fReviewview(f_num);
		mav.addObject("fReviewview", fReviewview);

		mav.addObject("fDTO", fDTO);
		mav.setViewName("guest/foodv/foodview");
		return mav;
	}

	// 식당 리뷰 작성
	public List<FoodReviewDTO> freviewwrite(FoodReviewDTO fReview) throws IllegalStateException, IOException {
		MultipartFile frfile = fReview.getFrfile();
		String f_r_photo = frfile.getOriginalFilename();
		System.out.println("봐바바" + f_r_photo);
		f_r_photo = System.currentTimeMillis() + "_" + f_r_photo;
		String savePath = "D:\\source\\Spring\\Thenale(index)\\src\\main\\webapp\\resources\\profile\\" + f_r_photo;
		if (!frfile.isEmpty()) {
			frfile.transferTo(new File(savePath));
		}
		fReview.setF_r_photo(f_r_photo);

		int result = fDAO.freviewwrite(fReview);
		List<FoodReviewDTO> freviewList = new ArrayList<FoodReviewDTO>();

		if (result > 0) {
			freviewList = fDAO.fRevieList(fReview.getF_num());
		} else {
		}
		return freviewList;
	}

	// 식당 메뉴 추가화면 띄우기
	public ModelAndView addmenu(String f_c_id) {
		mav = new ModelAndView();
		int addmenuResult = fDAO.addmenu(f_c_id);
		if (addmenuResult > 0) {
			mav.addObject("addmenuResult", addmenuResult);
			mav.setViewName("guest/foodv/addmenu");

		}

		return mav;
	}

	// 식당 메뉴 추가
	public ModelAndView foodmenuadd(foodMenuDTO foodMenu) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile f_m_file = foodMenu.getF_m_file();
		String f_m_foodimg = f_m_file.getOriginalFilename();

		f_m_foodimg = System.currentTimeMillis() + "_" + f_m_foodimg;

		String savePath = "D:\\source\\Spring\\Thenale(+동훈_11_27)\\src\\main\\webapp\\resources\\profile\\"
				+ f_m_foodimg;

		if (!f_m_file.isEmpty()) {
			f_m_file.transferTo(new File(savePath));
		}
		foodMenu.setF_m_foodimg(f_m_foodimg);

		int foodmenuaddResult = fDAO.foodmenuadd(foodMenu);
		if (foodmenuaddResult > 0) {
			mav.setViewName("guest/foodv/addmenu");
		}
		return mav;
	}

}