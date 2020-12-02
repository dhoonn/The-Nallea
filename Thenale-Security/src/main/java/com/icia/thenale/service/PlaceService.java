package com.icia.thenale.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.PlaceDAO;
import com.icia.thenale.dto.PlaceDTO;

@Service
public class PlaceService {

	@Autowired
	private PlaceDAO pDAO;
	private ModelAndView mav;
	
	public ModelAndView areaselect(String p_a_name) {
		mav = new ModelAndView();
		mav.addObject("p_a_name", p_a_name);
		mav.setViewName("placev/searchpage2");
	return mav;
}
	public ModelAndView areachoice(PlaceDTO place) {
		mav = new ModelAndView();
		PlaceDTO typechoice = pDAO.areachoice(place);
		mav.addObject("typechoice", typechoice);
		mav.setViewName("placev/searchresult");
		return mav;
	}

}
