package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.TrainerListVO;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	
	@GetMapping("/detail")
	public String detail() {
		
		return "trainer/trainer_detail";
		
	}
	
	@PostMapping("/detail")
	public String detail(Model model) {
		
		return "trainer/trainer_detail";
	}
	
	@GetMapping("/list")
	public String list(Model model) {
		
		
	model.addAttribute("list", trainerDao.selectTrainerList());	
		
	return "trainer/trainer_list";
		
	}
	
	

}
