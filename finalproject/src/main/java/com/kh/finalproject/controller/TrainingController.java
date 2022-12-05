package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.constant.SessionConstant;

@Controller
@RequestMapping("/mypage")
public class TrainingController {
	
	@RequestMapping("/training")
	public String training(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberId", memberId);
		return "mypage/training_list";
	}
}
