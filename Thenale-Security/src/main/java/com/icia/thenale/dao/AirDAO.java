package com.icia.thenale.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.icia.thenale.dto.AirDTO;

@Repository
public class AirDAO {

	@Autowired
	private SqlSessionTemplate sql;
	

}
