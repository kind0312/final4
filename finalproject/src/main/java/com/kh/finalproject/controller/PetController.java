package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class PetController {
	
	@RequestMapping("/pet")
	public String list(HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("memberId", memberId);
		return "mypage/pet_list";
	}
	
	@RequestMapping("/pet_insert")
	public String insert(HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("memberId", memberId);
		return "mypage/pet_insert";
	}
	
	@RequestMapping("/pet_detail")
	public String detail() {
		return "mypage/pet_detail";
	}

}
