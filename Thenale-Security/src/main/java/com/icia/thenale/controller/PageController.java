package com.icia.thenale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	/*
	 * @RequestMapping(value="/") public String index() throws Exception { return
	 * "index"; }
	 */
	
	@RequestMapping(value="/page")
	public String page() throws Exception {
		return "/page";
	}
	
	@RequestMapping(value="/testindex")
	public String test() throws Exception {
		return "/index(test)";
	}
	
	@RequestMapping(value="/company/page")
	public String userPage() throws Exception {
		return "/company/page";
	}
	
	@RequestMapping(value="/member/page")
	public String memberPage() throws Exception {
		return "/member/page";
	}
	
	@RequestMapping(value="/admin/page")
	public String adminPage() throws Exception {
		return "/admin/page";
	}
	

}
