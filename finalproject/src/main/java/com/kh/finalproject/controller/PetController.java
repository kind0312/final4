package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.repository.PetDao;

@Controller
@RequestMapping("/mypage")
public class PetController {
	
	@Autowired
	private PetDao petDao;
	
	@RequestMapping("/pet")
	public String list(HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("memberId", memberId);
		return "mypage/pet_list";
	}
	
	@RequestMapping("/pet_insert")
	public String insert(HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("memberId", memberId);
		return "mypage/pet_insert";
	}
	
//	@PostMapping("/pet_insert")
//	public String insert(@ModelAttribute PetDto petDto) {
//		System.out.println(petDto.getPetBirth());
//		System.out.println(petDto.getPetWeight());
//		petDao.insert(petDto);
//		return "redirect:/mypage/pet";
//	}
	
	@RequestMapping("/pet_detail")
	public String detail() {
		return "mypage/pet_detail";
	}

}
