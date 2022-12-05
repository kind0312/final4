package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/pet_detail")
	public String detail(@RequestParam int petNo, Model model) {
		model.addAttribute("petNo", petNo);
		return "mypage/pet_detail";
	}
	
	@RequestMapping("/pet_delete")
	public String delete(@RequestParam int petNo) {
		petDao.delete(petNo);
		return "redirect:/mypage/pet";
	}

}
