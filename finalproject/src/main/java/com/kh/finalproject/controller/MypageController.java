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
	@Autowired
	private ItemDao itemDao;
	
	@GetMapping("/point_list")
	public String list(
			@ModelAttribute PointDto pointDto,
			HttpSession session, Model model) {
		//String memberId = (String)session.getAttribute("loginId");
		String memberId = "test1234";
		model.addAttribute("point", pointDao.selectList(memberId));
		return "mypage/point_list";
	}
	 
	@GetMapping("/point_select")
	public String selectPay(@ModelAttribute ItemDto itemDto,
			Model model
			) {
		model.addAttribute("item", itemDao.selectList());
		return "mypage/point_select";
	}
	
	@GetMapping("/point_pay")
	public String pay(@RequestParam int itemPrice, Model model) {
		String memberId = "tmdwjd111";
		//model.addAttribute("point", memberDao.selectOne(memberId));
		model.addAttribute("itemPrice", itemPrice);
		return "mypage/point_pay";
	}
	
	@GetMapping("/point_pay_success")
	public String pay_success() {
		return "mypage/point_pay_success";
	}

}
