package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.finalproject.entity.AdminDto;

public class AdminController {
	
	
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	

	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto adminDto,HttpSession session) {
		
	    
		return "admin/inquiry";
		
		
	}
	
	
	
	

}
