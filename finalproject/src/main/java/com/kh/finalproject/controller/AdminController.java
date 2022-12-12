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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.ApplyDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.ApplyDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.MemberDetailVO;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.TrainerListSearchVO;
import com.kh.finalproject.vo.TrainerListVO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PetDao petDao;
	
	@Autowired
	private TrainerDao trainerDao;
	
	@Autowired
	private ApplyDao applyDao;
	
	@Autowired
	private AdminDao adminDao;
	

	
	//관리자 계정 로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	

	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto adminDto,HttpSession session) {
		
		AdminDto findDto=adminDao.selectOne(adminDto.getAdminId());
		if(findDto==null) {
			return "redirect:login?error";
		}
		boolean passwordMatch=adminDto.getAdminPw().equals(findDto.getAdminPw());
		if(passwordMatch) {
			session.setAttribute(SessionConstant.ID, adminDto.getAdminId());
			return "redirect:inquery"; 
		}else {
			return "redirect:/login?error";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("LoginId");
		return "redirect:/admin/login";
	}
	
	
	//관리자 일반회원 목록과 검색
	@GetMapping("/memberList")
	public String memberList(Model model,
			@ModelAttribute(name="vo") MemberListSearchVO vo) {
		model.addAttribute("memberList",memberDao.selectList(vo));
		
		

		return "admin/memberList";
	}
	//관리자 훈련사 목록과 검색
	@GetMapping("/trainerList")
	public String trainerList(Model model,
			@ModelAttribute(name="vo")  TrainerListSearchVO vo) {
		
		model.addAttribute("trainerList",trainerDao.selectList(vo));
	
		
		return "admin/trainerList";
	}
	
	
	//회원-상세
		@GetMapping("/memberDetail")
		public String memberDetail(Model model, @RequestParam String memberId) {
			
			//pet정보

			List<PetDto> petDto= petDao.selectList(memberId);
			model.addAttribute("petDto",petDto);
		
		    
			//회원 정보
		    MemberDto memberDto=memberDao.selectOne(memberId);
			model.addAttribute("memberDto",memberDto);

			 return "admin/memberDetail";
		}
		
		//훈련사-상세
		@GetMapping("/trainerDetail")
		public String trainerDetail(Model model, @RequestParam String memberId) {
			
			TrainerListVO trainerListVO=trainerDao.selectOne(memberId);
			model.addAttribute("trainerListVO",trainerListVO);
			
			
			return "admin/trainerDetail";
		}
		
	//관리자 훈련사-신청/전환/목록
	@GetMapping("/applyList")
	public String applyList(Model model)
	{
//		List<PetDto> petDto= petDao.selectList(memberId);
//		model.addAttribute("petDto",petDto);
//		
		List<ApplyDto> applyDto=applyDao.selectList();
	    model.addAttribute("applyDto",applyDto);
		
	    return "admin/applyList";
	}
		

			
	//관리자   훈련사-신청/전환 상세
	@GetMapping("/applyDetail")
	public String applyDetail(Model model,@RequestParam String memberId,int applyNo){
		//지원번호,회원아이디,지원날짜,연락처,지원상태(승인/반려/대기)...연락처만 회원 테이블에 있음..
		//model.addAttribute("applyList", )
		
		MemberDto memberDto=memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto);
		//TrainerListVO trainerListVO=trainerDao.selectOne(memberId);
		//model.addAttribute("trainerListVO",trainerListVO);
		
		ApplyDto applyDto=applyDao.selectOne(applyNo);
		model.addAttribute("applyDto",applyDto);
		//여기까지가 상세임.....상태는 신청으로 된 상태
		
		
		
	
		return "admin/applyDetail";
	}
	
//	@PostMapping("/aaplyDetail")
//	public String applyDetail(@ModelAttribute ApplyDto dto,RedirectAttributes attr) {
//		
//		attr.addAttribute("applyNo", dto.getApplyNo());
//		return "redirect:applyList";
//	
//
//	}
	

	//지원 승인
	@GetMapping("/apply_success")
	public String applySuccess(@RequestParam int applyNo,Model model) {
	
		return "admin/applySuccess";
	}
	
	@PostMapping("/apply_success")
	public String applySuccess(RedirectAttributes attr, @ModelAttribute ApplyDto dto) {
		
//		boolean result=applyDao.update(dto);
//		if(result) {
//			attr.addAttribute("applyNo",dto.getApplyNo());
//			return "redirect:applyList";
//		}
		boolean result=applyDao.update(dto);
		attr.addAttribute("applyNo",dto.getApplyNo());
		return "redirect:applyList";
		
		
	}
	
	//지원 반려
	@GetMapping("/apply_fail")
	public String applyFail(@RequestParam int applyNo) {
		
		
		return "admin/applyFail";
	}
	
	//지원 반려

	@PostMapping("/apply_fail")
	public String applyFail(RedirectAttributes attr, @ModelAttribute ApplyDto dto) {
		
//		boolean result=applyDao.update(dto);
//		if(result) {
//			attr.addAttribute("applyNo",dto.getApplyNo());
//			return "redirect:applyList";
//		}
		boolean result=applyDao.update2(dto);
		attr.addAttribute("applyNo",dto.getApplyNo());
		return "redirect:applyList";
		
		
	}

	

	


}
	
	
	
	
	


