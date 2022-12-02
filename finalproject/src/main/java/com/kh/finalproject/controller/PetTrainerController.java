package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trainer")
public class PetTrainerController {

	@RequestMapping("/main")
	public String main() {
		
		return "trainer/main";
	}
	
	@RequestMapping("/chat_list")
	public String chatlist() {
		
		return "trainer/chat_list";
	}
	
}
