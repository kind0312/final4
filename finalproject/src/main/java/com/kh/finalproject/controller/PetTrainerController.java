package com.kh.finalproject.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.FilesDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.TrainerDao;

import lombok.Builder;



@Controller
@RequestMapping("/trainer")
public class PetTrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	
	@Autowired
	private FilesDao filesDao;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@RequestMapping("/main")
	public String main() {
		
		return "trainer/main";
	}
	
	@RequestMapping("/request_list")
	public String requestList(@RequestParam int trainerNo, Model model) {
		trainerNo = 1;
		List<TrainingDto> list = trainerDao.requestList(trainerNo);
		model.addAttribute("requestList", list);		
		return "trainer/request_list";
	}
	
	@RequestMapping("/mypage_profile")
	public String mypageProfile(Model model,
			HttpSession session,
			@ModelAttribute TrainerDto trainerDto
			) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부
		
		return "trainer/mypage_profile";
	}
	
	
	@GetMapping("/mypage_profile_edit")
	public String mypageProfileEdit(Model model,@ModelAttribute TrainerDto trainerDto, HttpSession session) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);		
		TrainerDto dto = trainerDao.selectOnePro(memberId);		
		System.out.println("겟매핑 dto =" + dto);
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부		
		
		return "trainer/mypage_profile_edit";
	}
	
	
	
	
	@PostMapping("/mypage_profile_edit")		
	public String mypageProfileEdit(@ModelAttribute TrainerDto trainerDto, 
														@ModelAttribute MemberImgDto memberImgDto,
															HttpSession session) {  //동기로 처리
		
		//훈련사 Trainer 테이블 update					
		
		System.out.println("Post매핑 trainerDto=" + trainerDto);
		Boolean result =trainerDao.updateTrainer(trainerDto);
	
		
		
		//첨부파일 연결 db등록 member_img (member Dao에 update 메소드 가져와야함)
		//int filesNo = memberDao.findFileNo(SessionConstant.ID); //새로 넣은 filesNo를 가져와야하는데 이렇게 가져오면 예전걸 가져온단 말이지
				
		//member_img 테이블에 이전 데이터를 지우고 
		
		memberDao.memberProfileInsert(memberImgDto);	//이거 정상 작동함 
		
		if(result) {			
			return "redirect:trainer/mypage_profile";
		}else {
			return "redirect:fail";
		}
	}
	
//	@RequestMapping("/chat_list")
//	public String chatlist() {
//		
//		return "trainer/chat_list";
//	}
	
	
	
	
	
	
	@RequestMapping("/mypage_reservation")
	public String reservation() {
		
		
		return "trainer/mypage_reservation";
	}
	
	
}
	
	
	
	

	

