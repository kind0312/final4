package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.repository.MemberDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private MemberDao memberDao;
	

	
	//관리자 계정 로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	

	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto adminDto,HttpSession session) {
		
	    
		return "admin/inquiry";
		
	}
	
	//관리자 일반회원 목록과 검색
	@GetMapping("/memberList")
	public String memberList(Model model, 
			@RequestParam(required=false) String type,
			@RequestParam(required=false) String keyword) {
		boolean isSearch=type!=null& keyword!=null;
		if(isSearch) {
			model.addAttribute("memberList",memberDao.seletList(type,keyword));
		}
		else {
			model.addAttribute("memberList",memberDao.selectList());
		}
		return "admin/memberList";
		}
			
			 
	//memberDao.selectList(type,keyword)
}
	
	
	
	
	


