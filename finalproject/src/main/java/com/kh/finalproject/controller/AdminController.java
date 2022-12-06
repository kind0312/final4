package com.kh.finalproject.controller;

import java.util.List;

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
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

import com.kh.finalproject.vo.MemberListSearchVO;

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
			@ModelAttribute(name="vo") MemberListSearchVO vo) {
		model.addAttribute("memberList",memberDao.selectList(vo));
		
		
//		
//		boolean isSearch=type!=null& keyword!=null;
//		if(isSearch) {
//			model.addAttribute("memberList",memberDao.seletList(type,keyword));
//			//model.addAttribtute("memberList", memberDao.complexSearch(MemberDto dto));
//		}
//		else {
//			model.addAttribute("memberList",memberDao.selectList());
//		}
//		return "admin/memberList";
//		}
		return "admin/memberList";
	}
//	@RequestMapping("/memberList")
//	public String memberList(@ModelAttribute MemberSearchVO vo, Model model) {
//		List<MemberDto> list= memberDao.complexSearch(vo);
//		model.addAttribute("memberList",list);
//		return "admin/memberList";
//		
//		
//	}
	
	//회원-상세
	@GetMapping("/memberDetail")
	public String memberDetail(Model model, @RequestParam String memberId) {
		
		//회원 정보
		MemberDto memberDto=memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto);
		//pet정보
		
		
		
		
		return "admin/memberDetail";
	}
			 

}
	
	
	
	
	


