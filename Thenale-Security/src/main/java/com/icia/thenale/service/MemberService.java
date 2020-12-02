package com.icia.thenale.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dao.MemberDAO;
import com.icia.thenale.dto.MemberDTO;
import com.icia.thenale.dto.ScheduleDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mDAO;
	private ModelAndView mav;

	@Autowired
	private HttpSession session;

	// 회원가입
	public ModelAndView memberJoin(MemberDTO member) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile mfile = member.getMfile();
		String m_profile = mfile.getOriginalFilename();

		String savePath = "D:\\source\\Spring\\Thenale\\src\\main\\webapp\\resources\\profile\\" + m_profile;
		if (!mfile.isEmpty()) {
			mfile.transferTo(new File(savePath));
		}

		member.setM_profile(m_profile);
		int result = mDAO.memberJoin(member);
		if (result > 0)
			mav.setViewName("secu/memberlogin");
		else
			mav.setViewName("fail");
		return mav;
	}

	// 로그인
	public ModelAndView memberLogin(MemberDTO member) {
		mav = new ModelAndView();
		String loginId = mDAO.memberLogin(member);
		if (loginId != null) {
			session.setAttribute("loginId", loginId);
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("indexfail");
		}

		return mav;
	}

	// mypage
	public ModelAndView memberView(String m_id) {
		mav = new ModelAndView();
		MemberDTO mDTO = mDAO.memberView(m_id);

		mav.addObject("mDTO", mDTO);
		mav.setViewName("member/memberv/mypage");
		return mav;
	}

	// 회원 정보 수정(View 불러오기)
	public ModelAndView memberUpdate(String m_id) {
		mav = new ModelAndView();
		MemberDTO mDTO = mDAO.memberView(m_id);

		mav.addObject("mDTO", mDTO);
		mav.setViewName("member/memberv/memberupdate");
		return mav;
	}

	// 회원 정보 수정
	public ModelAndView memberUpdateProcess(MemberDTO member) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		MultipartFile mfile = member.getMfile();
		String m_profile = mfile.getOriginalFilename();
		String m_id = member.getM_id();
		String savePath = "D:\\source\\Spring\\Thenale\\src\\main\\webapp\\resources\\profile\\" + m_profile;
		if (!mfile.isEmpty()) {
			mfile.transferTo(new File(savePath));
		}

		member.setM_profile(m_profile);
		int result = mDAO.memberUpdate(member);
		if (result > 0)
			mav.setViewName("redirect:/mypage?m_id=" + m_id);
		return mav;
	}

	public String idOverlap(String m_id) {
		String checkResult = mDAO.idOverlap(m_id);
		String resultMsg = null;
		if (checkResult == null) {
			resultMsg = "OK";
		} else {
			resultMsg = "NO";
		}
		return resultMsg;
	}

	// 카카오 로그인
	public ModelAndView kakaoLogin(JsonNode profile) {
		mav = new ModelAndView();

		String m_k_id = profile.get("id").asText();
		String loginId = mDAO.kakaoLogin(m_k_id);
		session.setAttribute("loginId", loginId);
		mav.setViewName("redirect:/index");
		return mav;
	}

	// 네이버 로그인
	public ModelAndView naverLogin(String profile) throws ParseException {
		mav = new ModelAndView();
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(profile);
		JSONObject naverUser = (JSONObject) obj;
		JSONObject userInfo = (JSONObject) naverUser.get("response");

		String m_n_id = (String) userInfo.get("id");
		String loginId = mDAO.naverLogin(m_n_id);
		session.setAttribute("loginId", loginId);
		mav.setViewName("redirect:/index");
		return mav;
	}

	// 날짜 넣기
	public ModelAndView dateinsert(ScheduleDTO sche) {
		mav = new ModelAndView();
		int result = mDAO.dateinsert(sche);
		ScheduleDTO sDTO = mDAO.dateselect();
		mav.addObject("sche", sDTO);
		if (result > 0) {
			mav.setViewName("member/memberv/membercalendar");
		} else {
			mav.setViewName("fail");
		}
		return mav;
	}

}
