package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.repository.PointDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private PointDao pointDao;
	
//	@GetMapping("/point_list")
//	public String list(
//			@ModelAttribute PointDto pointDto,
//			HttpSession session, Model model) {
//		//String memberId = (String)session.getAttribute("loginId");
//		String memberId = "test1234";
//		//model.addAttribute("point", pointDao.selectList(memberId));
//		return "mypage/point_list";
//	}
	
	@RequestMapping("/point")
	public String list() {
		return "mypage/point_list";
	}
	
	
	

}
