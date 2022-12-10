package com.kh.finalproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PetDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListVO;

@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	@Autowired
	private TrainerDao trainerDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	 private PetDao petDao;
	
	//훈련사 디테일(단일조회)
	@GetMapping("/detail")
	public String detail(Model model,
			@ModelAttribute TrainerListVO trainerListvo,
			@ModelAttribute ReviewVO reviewVo
			) {
		
		model.addAttribute("list", trainerDao.selectOne(trainerListvo.getMemberId()));	
		model.addAttribute("review", trainerDao.selectTrainerReview(reviewVo.getTrainerNo()));
		
		return "trainer/trainer_detail";
		
	}
	
	@PostMapping("/detail")
	public String detail() {
		
		return "trainer/trainer_detail";
	}
	
	//훈련사 목록 
	@GetMapping("/list")
	public String list(Model model) {
		
		
	model.addAttribute("list", trainerDao.selectTrainerList());	
		
	return "trainer/trainer_list";
		
	}
	
	
	@GetMapping("/reservation")
	public String reservation(@ModelAttribute MemberDto memberDto,Model model,
			@RequestParam int trainerNo,
			HttpSession session) {
		
		
		String userId = (String)session.getAttribute(SessionConstant.ID);
		
		memberDto.setMemberId(userId);
		
		model.addAttribute("member", memberDao.selectOne(userId));
		model.addAttribute("pet", petDao.list(userId));
		model.addAttribute("trainerno",trainerNo);
		
		return "/trainer/reservation";
	}
	
	
	@PostMapping("/reservation")
	public String reservation(HttpSession session,
			RedirectAttributes attr,
			@ModelAttribute TrainingDto trainingDto,
			Model model
			) throws IllegalStateException, IOException {
		
		String userId = (String)session.getAttribute(SessionConstant.ID);
		trainingDto.setMemberId(userId);
		
		return "/trainer/reservation";
	}
	
	
	
	

}
