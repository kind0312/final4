package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PointDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PointDao pointDao;
	
	@RequestMapping("/point")
	public String list(HttpSession session, Model model) {
		String memberId = (String)session.getAttribute(SessionConstant.ID);
		model.addAttribute("point", memberDao.selectOne(memberId));
		List<PointDto> list = pointDao.selectList(memberId);
		model.addAttribute("list", list);
		return "mypage/point_list";
	}
	
	
	

}
