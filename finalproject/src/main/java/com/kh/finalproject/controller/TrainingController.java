package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.repository.TrainingDao;

@Controller
@RequestMapping("/mypage")
public class TrainingController {

	@Autowired
	private TrainingDao trainingDao;

	@RequestMapping("/training")
	public String training(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("ingList", trainingDao.ingList(memberId));
		model.addAttribute("endList", trainingDao.endList(memberId));
		return "mypage/training_list";
	}
}
