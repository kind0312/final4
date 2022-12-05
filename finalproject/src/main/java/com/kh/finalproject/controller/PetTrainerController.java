package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.TrainerDao;

@Controller
@RequestMapping("/trainer")
public class PetTrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	
	@RequestMapping("/main")
	public String main() {
		
		return "trainer/main";
	}
	
	@GetMapping("/request_list")
	public String requestList(@RequestParam int trainerNo, Model model) {
		trainerNo = 1;
		List<TrainingDto> list = trainerDao.requestList(trainerNo);
		model.addAttribute("requestList", list);		
		return "trainer/request_list";
	}
	
	@GetMapping("/mypage_profile")
	public String mypageProfile() {
		
		return "trainer/mypage_profile";
	}
	
	
//	@RequestMapping("/chat_list")
//	public String chatlist() {
//		
//		return "trainer/chat_list";
//	}
	
}
