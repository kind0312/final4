package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	
	@GetMapping("/detail")
	public String detail() {
		
		return "trainer/trainer_detail";
		
	}
	
	@PostMapping("/detail")
	public String detail(Model model) {
		
		return "trainer/trainer_detail";
	}
	
	@GetMapping("/list")
	public String list() {
		
		return "trainer/trainer_list";
		
	}
	
	

}
