package com.icia.thenale.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.CustomUserDetails;

@Repository("userAuthDAO")
public class UserAuthDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public CustomUserDetails getUserById(String username) {
		System.out.println("pointdao : "+ username);
		return sqlSession.selectOne("user.selectUserById", username);
	}

}