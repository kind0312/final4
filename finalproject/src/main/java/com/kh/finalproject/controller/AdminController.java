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
import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.PointListVO;
import com.kh.finalproject.vo.TrainerListSearchVO;


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
	private PointDao pointDao;
	
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
		
		//TrainerListVO trainerListVO=trainerDao.selectOne(memberId);
		//model.addAttribute("trainerListVO",trainerListVO);
		
		return "admin/trainerDetail";
	}
	
	//포인트 이용내역
	@GetMapping("/memberPoint")
	public String memberPoint(@ModelAttribute(name = "vo") PointListVO vo,
			Model model, @RequestParam String memberId) {
		
		vo.setMemberId(memberId);
		int count = pointDao.count(vo);
		vo.setCount(count);
		vo.setSize(10);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		
		model.addAttribute("list", pointDao.listAll(vo)); 
		return "admin/memberPoint";
	}
	
	
	
	

}
	
	
	
	
	


