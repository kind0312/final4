package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListVO;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	
	//훈련사 디테일(단일조회)
	@GetMapping("/detail")
	public String detail(Model model,
			@ModelAttribute TrainerListVO trainerListvo,
			@ModelAttribute ReviewVO reviewVo
			) {
		
		model.addAttribute("list", trainerDao.selectOne(trainerListvo.getMemberId()));	
		model.addAttribute("review", trainerDao.selectTrainerReview(reviewVo.getTrainerNo()));
		
		return "trainer/trainer_detail";
		
	}
	
	@PostMapping("/detail")
	public String detail() {
		
		return "trainer/trainer_detail";
	}
	
	//훈련사 목록 
	@GetMapping("/list")
	public String list(Model model) {
		
		
	model.addAttribute("list", trainerDao.selectTrainerList());	
		
	return "trainer/trainer_list";
		
	}
	
	

}
