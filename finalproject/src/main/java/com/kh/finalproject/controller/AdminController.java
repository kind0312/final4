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
import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.ApplyDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.PointListVO;
import com.kh.finalproject.vo.PetInsertVO;
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
	private PointDao pointDao;	
	@Autowired
	private ApplyDao applyDao;	
	@Autowired
	private AdminDao adminDao;

	
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
		
		//관리자 훈련서비스 신청 목록
		@GetMapping("/trainingList")
		public String trainingList(Model model)
		{
			List<ApplyDto> applyDto=applyDao.selectList();
		    model.addAttribute("applyDto",applyDto);
			
		    return "admin/trainingList";
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
//		
//		
		List<ApplyDto> applyDto=applyDao.selectList();
	    model.addAttribute("applyDto",applyDto);
		
	    return "admin/applyList";
	}
		

			
	//관리자   훈련사-신청/전환 상세
	@GetMapping("/applyDetail")
	public String applyDetail(Model model,@RequestParam String memberId){
		
		MemberDto memberDto=memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto);

		List<PetDto> petDto= petDao.selectList(memberId);
		model.addAttribute("petDto",petDto);
	    
		//회원 정보
	    MemberDto memberDto1=memberDao.selectOne(memberId);
		model.addAttribute("memberDto",memberDto1);		
		
		ApplyDto applyDto=applyDao.selectone(memberId);
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
	public String applySuccess(@RequestParam String memberId) {
		
	
	
		return "admin/apply_success";
	}
	
	@PostMapping("/apply_success")
	public String applySuccess(@ModelAttribute ApplyDto applyDto,@ModelAttribute TrainerDto trainerDto) {
		
		
		
		//지원 상태를 승인으로 변경
		applyDao.status1(applyDto.getMemberId());
		
		int trainerNo=trainerDao.sequence();
		//trainer 훈련사 DB등록
		TrainerDto a=TrainerDto.builder()
				.trainerNo(trainerNo)
				.memberId(trainerDto.getMemberId())
                .applyNo(trainerDto.getApplyNo())
                .trainerProfile(trainerDto.getTrainerProfile())
                .trainerProfileContent(trainerDto.getTrainerProfileContent())
                .trainerLike(trainerDto.getTrainerLike())
                .build();
		trainerDao.insert(a);
		
		return "redirect:/admin/applyList";
	}
	
	
	
	//지원 반려
	@GetMapping("/apply_fail")
	public String applyFail(@RequestParam String memberId) {

		return "admin/apply_fail";
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



//	@PostMapping("/apply_fail")
//	public String applyFail(RedirectAttributes attr, @ModelAttribute ApplyDto dto) {
		
//		boolean result=applyDao.update(dto);
//		if(result) {
//			attr.addAttribute("applyNo",dto.getApplyNo());
//			return "redirect:applyList";
//		}
//		boolean result=applyDao.update2(dto);
//		attr.addAttribute("applyNo",dto.getApplyNo());
//		return "redirect:applyList";
		
		
//	}

}
	
	
	
	
	


