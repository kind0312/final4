package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.repository.PetDao;

@Controller
@RequestMapping("/mypage")
public class PetController {
	
	@Autowired
	private PetDao petDao;
	
	@RequestMapping("/pet")
	public String list(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("memberId", memberId);
		
		//방법1. pet, pet_img > left join 해서 petInsertVO에 저장 후 모델로 출력하기
		model.addAttribute("pet", petDao.list(memberId));
		
		return "mypage/pet_list";
	}
	
	@RequestMapping("/pet_insert")
	public String insert(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		int petNo = petDao.sequence();
		model.addAttribute("memberId", memberId);
		model.addAttribute("petNo", petNo);
		return "mypage/pet_insert";
	}
	
	@RequestMapping("/pet_detail")
	public String detail(@RequestParam int petNo, Model model) {
		//1. petNo로 petDto 값 꺼내기
		//2. petNo로 pet_img의 filesNo 값 꺼내기
		//3. 각각 model로 넘기기
		//model.addAttribute("pet", petDao.selectOne(petNo));
		
		model.addAttribute("filesNo", petDao.selectFileNo(petNo));
		model.addAttribute("petNo", petNo);
		return "mypage/pet_detail";
	}
	
	@RequestMapping("/pet_delete")
	public String delete(@RequestParam int petNo) {
		petDao.delete(petNo);
		return "redirect:/mypage/pet";
	}

}
