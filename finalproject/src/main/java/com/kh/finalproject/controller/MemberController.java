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

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private FilesDao filesDao;
	
	//회원가입
	@GetMapping("/insert")
	public String insert() {
		return "member/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemberDto memberDto,
						@ModelAttribute MemberImgDto memberImgDto) {
		memberDao.insert(memberDto);
		memberDao.memberProfileInsert(memberImgDto);
		return "redirect:insert_success";
	}
	
	//회원가입 성공
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
			@ModelAttribute MemberDto memberDto) {
		boolean login = memberDao.login(memberDto);
		if(login) {
			session.setAttribute(SessionConstant.ID, memberDto.getMemberId());
			
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
	
	//아이디 찾기
	@GetMapping("/find_memberid")
	public String findMemberId() {
		return "member/find_memberid";
	}
	
	@PostMapping("/find_memberid")
	public String findMemberId(@ModelAttribute MemberDto meberDto) {
		boolean find = memberDao.findId(meberDto);
		if(find) {
			return "redirect:find_memberid_success";
		}
		else {
			return "redirect:find_memberid?error";
		}
	}
	
	//아이디 찾기 성공
	@GetMapping("/find_memberid_success")
	public String findMemberIdSuccess(Model model, @ModelAttribute MemberDto memberDto) {
		model.addAttribute("memberDto", memberDao.find(memberDto));
		return "member/find_memberid_success";
	}
}
