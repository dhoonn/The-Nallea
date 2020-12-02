package com.icia.thenale.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.thenale.dto.PlaceDTO;

@Repository
public class PlaceDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public PlaceDTO areachoice(PlaceDTO place) {
		return sql.selectOne("Place.typeChoice", place);
	}

}
