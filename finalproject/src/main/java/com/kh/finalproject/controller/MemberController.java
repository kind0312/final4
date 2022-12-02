package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "member/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemberDto memberDto) {
		memberDao.insert(memberDto);
		return "redirect:insert_success";
	}
	
	@GetMapping("/insert_success")
	public String insertSuccess() {
		return "member/insert_success";
	}
}
