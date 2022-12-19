package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.ChatListVO;
import com.kh.finalproject.vo.TrainerListVO;

@Controller
public class HomeController {
	
	@Autowired
	private ChatDao chatDao;
	@Autowired
	private TrainerDao trainerDao;
	
	@RequestMapping("/")
	public String home(Model model, HttpSession session) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		
		if(memberId != null) {
			List<ChatListVO> listVO = chatDao.chatRoomList(memberId); //아이디로 리스트 찾아오기(일반회원 기준)		
			model.addAttribute("chatList" , listVO);
			//트레이너 정보 출력
			List<TrainerListVO> vo = trainerDao.mainTrainerList();
			model.addAttribute("trainerList", vo);
			return "home";
		}
		
		//트레이너 정보 출력
		List<TrainerListVO> vo = trainerDao.mainTrainerList();
		model.addAttribute("trainerList", vo);
		
		return "home";
	}
}
