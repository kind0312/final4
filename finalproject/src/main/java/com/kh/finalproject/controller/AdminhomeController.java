package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminhomeController {

	
	@RequestMapping("/adminHome")
	public String adminHome() {
		return "admin/adminHome";
	}
}
