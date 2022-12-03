package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.ItemDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.repository.ItemDao;
import com.kh.finalproject.repository.PointDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private PointDao pointDao;
	
	@GetMapping("/point_list")
	public String list(
			@ModelAttribute PointDto pointDto,
			HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("point", pointDao.selectList(memberId));
		return "mypage/point_list";
	}
	 
	

}
