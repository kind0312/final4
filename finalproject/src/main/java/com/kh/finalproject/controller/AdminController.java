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
import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.ApplyDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.repository.TrainingDao;


import com.kh.finalproject.vo.ApplyDetailVO;
import com.kh.finalproject.vo.ApplyListSearchVO;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.PetInsertVO;
import com.kh.finalproject.vo.PointListVO;
import com.kh.finalproject.vo.ReservationDetailListVO;
import com.kh.finalproject.vo.TrainerListSearchVO;
import com.kh.finalproject.vo.TrainerListVO;
import com.kh.finalproject.vo.TrainingMemberVO;
import com.kh.finalproject.vo.TrainingRequestListVO;
import com.kh.finalproject.vo.TrainingUsageVO;


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
	@Autowired
	private ApplyDao applyDao;	
	@Autowired
	private AdminDao adminDao;

    @Autowired
    private TrainingDao trainingDao;

	
	//관리자 계정 로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	//리퀘스트파람 아이디 비밀번호 인풋에 있는 네임이랑 똑같음이름
	@PostMapping("/login")
	public String login(@ModelAttribute AdminDto adminDto,HttpSession session) {
		
		//받아온 아이디로 여기
		AdminDto findDto=adminDao.selectOne(adminDto.getAdminId());
		if(findDto==null) {
			return "redirect:login?error";
		}
		
		//adminDto.getAdminPw() 이부분에 파라미터로 받아온 비밀번호 변수 넣어요
		
		boolean passwordMatch=adminDto.getAdminPw().equals(findDto.getAdminPw());
		if(passwordMatch) {
			session.setAttribute(SessionConstant.ID, adminDto.getAdminId());
			return "redirect:/adminHome"; 
		}else {
			return "redirect:/login?error";
			
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
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

//			List<PetDto> petDto= petDao.selectList(memberId);
//			model.addAttribute("petDto",petDto);
		    
		//회원 정보
	    MemberDto memberDto=memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto);
		
		//첨부파일+pet
		//해당 아이디의 반려동물 번호의 이미지 모두 출력
		List<PetInsertVO> list=petDao.list(memberId);
		model.addAttribute("list",list);

		 return "admin/memberDetail";
	}
	
	//포인트 이용내역
	@GetMapping("/memberPoint")
	public String memberPoint(@ModelAttribute(name = "vo") PointListVO vo,
			Model model) {
		
		model.addAttribute("member",memberDao.selectOne(vo.getMemberId()));
		
		vo.setMemberId(vo.getMemberId());
		vo.setSize(10);
		int count = pointDao.count(vo);
		vo.setCount(count);
		
		int endRow = vo.getP()*vo.getSize();
		int startRow = endRow - (vo.getSize() - 1);
		vo.setEndRow(endRow);
		vo.setStartRow(startRow);
		
		model.addAttribute("list", pointDao.listAll(vo)); 
		return "admin/memberPoint";
	}
	
	//관리자 훈련서비스 신청 목록
	//@GetMapping("/trainingList")
	//public String trainingList(Model model)
	//{
	//	List<ApplyDto> applyDto=applyDao.selectList();
	 //   model.addAttribute("applyDto",applyDto);
	//	
	 //   return "admin/trainingList";
	//}
			
			

	//훈련사-상세
	@GetMapping("/trainerDetail")
	public String trainerDetail(Model model, @RequestParam String memberId) {
		
		TrainerListVO trainerListVO=trainerDao.selectOne(memberId);
		model.addAttribute("trainerListVO",trainerListVO);
		return "admin/trainerDetail";
	}

	//관리자 훈련사-신청/전환/목록
	@GetMapping("/applyList")
	public String applyList(Model model, @ModelAttribute ApplyListSearchVO vo){
	    
		//List<ApplyDto> applyDto=applyDao.selectList();
	   // model.addAttribute("applyDto",applyDto);
		model.addAttribute("list",applyDao.selectList(vo));
	    return "admin/applyList";
	}
	
	//훈련 지원 상세
	@GetMapping("/applyDetail")
	public String applyDetail(Model model,@RequestParam int applyNo){
		//model에 넘길 데이터
		model.addAttribute("detail", applyDao.detailOne(applyNo));
		
		return "admin/applyDetail";
	}
	
	@PostMapping("/applyDetail")
	public String applyDetail(
			@ModelAttribute TrainerDto dto,RedirectAttributes attr) {
		//훈련사 테이블 insert
		System.out.println(dto);
		TrainerDto trainerDto = TrainerDto.builder()
				.memberId(dto.getMemberId())
				.applyNo(dto.getApplyNo())
				.trainerProfile(" ")
				.trainerProfileContent(" ")
				.trainerLike(0)
				.build();
		trainerDao.insert(trainerDto);
		
		//회원 테이블 회원상태 y로 변경
		memberDao.statusChange(dto.getMemberId());
		
		//지원테이블 상태 변경(신청>승인)
		applyDao.status1(dto.getMemberId());
		
		return "redirect:/admin/apply_success";
	}

	//지원 승인
	@GetMapping("/apply_success")
	public String applySuccess() {
		return "admin/apply_success";
	}
	
	//지원 반려
	@GetMapping("/apply_fail")
	public String applyFail(@RequestParam String memberId) {
		return "admin/apply_fail";
	}
	
	//포인트 상품권(item)
	@RequestMapping("/itemList")
	public String itemList() {
		return "admin/itemList";
	}



	
	//관리자 회원/훈련이용내역
	@GetMapping("/training_list")
	public String trainingList(Model model, @RequestParam String memberId){
		//훈련서비스고유번호, 훈련날짜,훈련사, 이용상태
		//member_id는 중복이 당연히 될 수 있는 것임....traing_no만 안겹치면 됨....
		
		//member_id를 받아 와서 그 회원이 이용한 훈련 정보 출력
	
	    List<TrainingUsageVO> trainingUsageVO=trainingDao.selectList(memberId);
	    model.addAttribute("trainingUsageVO",trainingUsageVO);
		
	    return "admin/training_list";
	}
	
	//관리자 회원/훈련 상세내역
	@GetMapping("/training_detail")
	public String trainingDetail(Model model, @RequestParam int trainingNo) {
	
		//사진 제외 훈련 이용내역
		TrainingMemberVO  trainingMemberVO =trainingDao.selectDetail(trainingNo);
		model.addAttribute("trainingMemberVO",trainingMemberVO);
		
		//pet+사진 
		
		List<ReservationDetailListVO> list=trainingDao.usageDetail(trainingNo);
		model.addAttribute("list",list);
	


		return "admin/training_detail";
	}
	
	
	
	
	
	
}
	
	
	
	
	


