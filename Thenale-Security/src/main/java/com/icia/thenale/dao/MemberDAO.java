package com.icia.thenale.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.MemberDTO;
import com.icia.thenale.dto.ScheduleDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// 회원가입
	public int memberJoin(MemberDTO member) {
		if (member.getM_k_id() != null) {
			return sql.insert("Member.kakaomemberJoin", member);
		} else if (member.getM_n_id() != null) {
			return sql.insert("Member.navermemberJoin", member);
		} else {
			return sql.insert("Member.memberJoin", member);
		}
	}

	// 로그인
	public String memberLogin(MemberDTO member) {
		return sql.selectOne("Member.memberLogin", member);
	}

	// 내 정보 mypage
	public MemberDTO memberView(String m_id) {
		return sql.selectOne("Member.memberView", m_id);
	}

	// 멤버 수정
	public int memberUpdate(MemberDTO member) {
		return sql.update("Member.memberUpdate", member);
	}

	// 아이디 중복확인
	public String idOverlap(String m_id) {
		return sql.selectOne("Member.idOverlap", m_id);
	}

	// 카카오 로그인
	public String kakaoLogin(String m_k_id) {
		return sql.selectOne("Member.kakaoLogin", m_k_id);
	}

	// 네이버 로그인
	public String naverLogin(String m_n_id) {
		return sql.selectOne("Member.naverLogin", m_n_id);
	}

	// 날짜 넣기
	public int dateinsert(ScheduleDTO sche) {
		return sql.insert("Member.dateinsert", sche);
	}

	// 날짜 확인
	public ScheduleDTO dateselect() {
		return sql.selectOne("Member.dateselect");
	}

}
