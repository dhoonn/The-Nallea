package com.icia.thenale.service;

import java.io.IOException;
import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.api.ApiExplorer;
import com.icia.thenale.dao.AirDAO;
import com.icia.thenale.dto.AirDTO;


@Service
public class AirService {
	
	@Autowired
	private AirDAO aDAO;
	private ModelAndView mav;
		
	public ModelAndView airSearch(String depAirportId, String arrAirportId, String startDate) throws IOException {
		mav = new ModelAndView();
		List<AirDTO> airList = new ArrayList<AirDTO>();
		
		String[] args = new String[3];
		args[0] = depAirportId;
		args[1] = arrAirportId;
		args[2] = startDate;
		airList = ApiExplorer.main(args); // 조건을 ApiExplorer.main으로 보내고 결과를 mav에 저장해온다. mav에 있는 list dao랑 mapper로 보내야함.
		System.out.println("###"+airList+"###");
		mav.addObject("airList", airList);
		mav.setViewName("member/air/airsearchresult"); 
		return mav;
	}
// airsearchresult
	

}//Service
