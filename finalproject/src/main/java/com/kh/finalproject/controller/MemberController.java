package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	//회원가입
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
	
	//로그인
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, 
			String memberId, String memberPw) {
		MemberDto findDto = memberDao.selectOne(memberId);
		
		if(findDto == null) {
			return "redirect:login?error";
		}
		
		boolean isLogin = memberPw.equals(findDto.getMemberPw());
		if(isLogin) {
			session.setAttribute(SessionConstant.ID, memberId);
			
//			//로그인 시간을 갱신시키는 작업
//			memberDao.updateLoginTime(findDto.getMemberId());
			
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute(SessionConstant.ID);
		return "redirect:/";
	}
}
