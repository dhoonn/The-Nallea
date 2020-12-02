package com.icia.thenale.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.HotelDAO;
import com.icia.thenale.dto.CompanyDTO;
import com.icia.thenale.dto.HotelDTO;
import com.icia.thenale.dto.HotelRoomDTO;

@Service
public class HotelService {

	@Autowired
	private HotelDAO hDAO;
	private ModelAndView mav;

	// 호텔 권한부여 및 업체정보 넘겨주기
	public ModelAndView hotelAddmission(CompanyDTO company) {
		mav = new ModelAndView();
		int hotelAddmitionResult = hDAO.hotelAddmission(company);
		if (hotelAddmitionResult > 0) {
			mav.setViewName("companyv/companyview");
		} else {
			mav.setViewName("fail");

		}
		return mav;
	}

	// 호텔 리스트 출력
	public ModelAndView hotelareaselect(String h_area) {

		mav = new ModelAndView();
		List<HotelDTO> hList = new ArrayList<HotelDTO>();

		hList = hDAO.hotelList(h_area);
		mav.addObject("hList", hList);
		mav.setViewName("companyv/hotellist");

		return mav;
	}

	// 호텔 상세 조회
	public ModelAndView hotelView(int h_num) {
		mav = new ModelAndView();
		HotelDTO hDTO = hDAO.hotelView(h_num);
		int Hits = hDAO.hotelHits(h_num);
		List<HotelRoomDTO> hrDTO = hDAO.hotelRoomView(h_num);
		if (Hits > 0) {
		mav.addObject("hDTO", hDTO);
		mav.addObject("hrDTO", hrDTO);
		mav.setViewName("hotelv/hotelview");
		}
		return mav;
	}

	// 호텔 객실 추가 화면 띄우기
	public ModelAndView addroom(String h_c_id) {
		mav = new ModelAndView();
		int addroomResult = hDAO.addmenu(h_c_id);
		if (addroomResult > 0) {
			mav.addObject("addroomResult", addroomResult);
			mav.setViewName("foodv/addroom");

		}
		return mav;
	}

	public ModelAndView hotelroomadd(HotelRoomDTO hotelRoom) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile hrfile = hotelRoom.getHrfile();
		String h_sublimg = hrfile.getOriginalFilename();

		h_sublimg = System.currentTimeMillis() + "_" + h_sublimg;

		String savePath ="D:\\source\\Spring\\Thenale(+동훈_11_27)\\src\\main\\webapp\\resources\\profile\\"
				+ h_sublimg;
		if (!hrfile.isEmpty()) {
			hrfile.transferTo(new File(savePath));
		}
		hotelRoom.setH_hotelimg(h_sublimg);
		int hotelroomaddResult = hDAO.hotelroomadd(hotelRoom);
		if (hotelroomaddResult > 0) {
			mav.setViewName("foodv/addroom");
		}
		return mav;
	}
}