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
		//System.out.println(dto);
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
		System.out.println(dto);
		model.addAttribute("trainerDto", dto );	
		
		//멤버 아이디로 파일 조회해 오는것도 추가해야함
		int filesNo = memberDao.findFileNo(memberId); //멤버 아이디로 파일 번호 조회해옴
		model.addAttribute("filesDto", filesDao.find(filesNo)); //조회해온 번호로 filesDto 정보 model에 첨부		
		
		return "trainer/mypage_profile_edit";
	}
	
	
	
	
	@PostMapping("/mypage_profile_edit")		
	public String mypageProfileEdit(@RequestBody TrainerDto trainerDto) {  //동기로 처리
		
		//훈련사 Trainer 테이블 update		
		
		TrainerDto dto = TrainerDto.builder()
				.trainerNo(trainerDto.getApplyNo())
				.memberId(trainerDto.getMemberId())
				.applyNo(trainerDto.getApplyNo())
				.trainerProfile(trainerDto.getTrainerProfile())
				.trainerProfileContent(trainerDto.getTrainerProfileContent())
				.build();			
		
		Boolean result =trainerDao.updateTrainer(dto);
		System.out.println(result);
		
		
		//첨부파일 연결 db등록 member_img (member Dao에 insert 메소드 가져와야함)
		//memberDao.insertImg(memberImgDto);	
		
		if(result) {			
			return "redirect:trainer/mypage_profile";
		}
		else {
			return "redirect:fail";
			}
		}
	
	
	}
	
	
	
	
//	@RequestMapping("/chat_list")
//	public String chatlist() {
//		
//		return "trainer/chat_list";
//	}
	

