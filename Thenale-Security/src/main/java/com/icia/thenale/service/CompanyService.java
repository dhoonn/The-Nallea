package com.icia.thenale.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.CompanyDAO;
import com.icia.thenale.dao.FoodDAO;
import com.icia.thenale.dao.HotelDAO;
import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.FoodDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.MemberDTO;

@Service
public class CompanyService {

	@Autowired
	private FoodDAO fDAO;

	@Autowired
	private HotelDAO hDAO;

	@Autowired
	private CompanyDAO cDAO;
	private ModelAndView mav;
	@Autowired
	private HttpSession session;

	// 업체 회원가입
	public ModelAndView companyJoin(CompanyDTO company) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile cfile = company.getCfile();
		String c_photo = cfile.getOriginalFilename();

		c_photo = System.currentTimeMillis() + "_" + c_photo;
		String savePath = "D:\\source\\Spring\\Thenale(+동훈_11_27)\\src\\main\\webapp\\resources\\profile\\" + c_photo;
		if (!cfile.isEmpty()) {
			cfile.transferTo(new File(savePath));
		}

		company.setC_photo(c_photo);

		int result = cDAO.companyJoin(company);
		if (result > 0)
			mav.setViewName("secu/companylogin");
		return mav;
	}

	// 로그인
	public ModelAndView companyLogin(CompanyDTO company, String c_id) {
		mav = new ModelAndView();
		String loginId = cDAO.companyLogin(company);

		if (loginId != null) {
			session.setAttribute("loginId", loginId);
			mav.setViewName("company/companyv/companypage");
		} else {
			mav.setViewName("indexfail");
		}

		CompanyDTO companyview = cDAO.companyView(c_id);

		mav.addObject("companyview", companyview);

		return mav;
	}

	// 업체 리스트
	public ModelAndView companyList(CompanyDTO company) {
		mav = new ModelAndView();
		List<CompanyDTO> cList = cDAO.compnayList();
		mav.addObject("cList", cList);
		mav.setViewName("admin/admin");
		return mav;

	}

	// 업체 상세 보기
	public ModelAndView companyView(String c_id) {
		mav = new ModelAndView();
		CompanyDTO cDTO = cDAO.companyView(c_id);

		mav.addObject("cDTO", cDTO);
		mav.setViewName("company/companyv/companyview");
		return mav;
	}

	// 업체 승인 허가 및 데이터 삽입
	public ModelAndView companyAdminssion(CompanyDTO company) {
		mav = new ModelAndView();
		int Result = cDAO.companyAdminssion(company);
		if (Result > 0)
			mav.setViewName("redirect:/manager");
		return mav;
	}

	// 업체 삭제
	public ModelAndView companyDelete(String c_id) {
		mav = new ModelAndView();
		int deleteResult = cDAO.companyDelete(c_id);
		if (deleteResult > 0) {
			mav.setViewName("redirect:/manager");
		}

		return mav;
	}

}
