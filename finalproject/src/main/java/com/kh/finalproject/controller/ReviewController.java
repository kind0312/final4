package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//이용후기 목록
	@GetMapping("/list")
	private String list(Model model) {
		model.addAttribute("reviewList", reviewDao.reviewList());
		return "review/review_list";
	}
}
