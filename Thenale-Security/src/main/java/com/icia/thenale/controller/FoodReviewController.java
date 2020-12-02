package com.icia.thenale.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.icia.thenale.dto.FoodReviewDTO;
import com.icia.thenale.service.FoodService;

@Controller
@RequestMapping("/freview/*")
public class FoodReviewController {
	@Autowired
	private FoodService fService;

	// 식당 리뷰 작성
	@RequestMapping(value = "/freviewwrite")
	public @ResponseBody List<FoodReviewDTO> freviewwrite(@ModelAttribute FoodReviewDTO FReview,
			MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		List<FoodReviewDTO> freviewList = fService.freviewwrite(FReview);
		return freviewList;

	}

}
