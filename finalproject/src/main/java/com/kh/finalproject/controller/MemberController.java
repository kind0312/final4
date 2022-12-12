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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.TrainerDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FilesDao filesDao;
	@Autowired
	private TrainerDao trainerDao;
	
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
		session.removeAttribute(SessionConstant.trainingNo);
		return "redirect:/";
	}
	
	//아이디 찾기
	@GetMapping("/find_memberid")
	public String findMemberId() {
		return "member/find_memberid";
	}
	
	@PostMapping("/find_memberid")
	public String findMemberId(@ModelAttribute MemberDto memberDto,
			RedirectAttributes attr) {
		boolean find = memberDao.findId(memberDto);
		if(find) {
			attr.addAttribute("memberName", memberDao.find(memberDto).getMemberName());
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
	
	//비밀번호 찾기
	@GetMapping("/find_memberpw")
	public String findMemberPw() {
		return "member/find_memberpw";
	}
	
	@PostMapping("/find_memberpw")
	public String findMemberPw(@ModelAttribute MemberDto memberDto,
			RedirectAttributes attr) {
		boolean judge = memberDao.findPw(memberDto);
		if(judge) {
			attr.addAttribute("memberId", memberDao.certPw(memberDto).getMemberId());
			return "redirect:change_memberpw";
		}
		else {
			return "redirect:find_memberpw?error";
		}
	}
	
	//비밀번호 찾은 후 변경
	@GetMapping("/change_memberpw")
	public String changeMemeberPw(@ModelAttribute MemberDto memberDto, Model model) {
		model.addAttribute("memberDto", memberDao.certPw(memberDto));
		return "member/change_memberpw";
	}
	
	@PostMapping("/change_memberpw")
	public String changeMemeberPw(@ModelAttribute MemberDto memberDto) {
		memberDao.changePw(memberDto);
		return "redirect:change_memberpw_success";
	}
	
	//비밀번호 변경 완료
	@GetMapping("/change_memberpw_success")
	public String changeMemberPwSuccess() {
		return "member/change_memberpw_success";
	}
}
