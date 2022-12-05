package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.MemberDto;



@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/testhome")
	public String home() {
		return "chat/testhome";
	}
	
	//이건 로그인 구현이안돼서 test용으로 만든거라 구현되면 지워야함 
	@PostMapping("/testlogin")
	public String testLogin(@ModelAttribute MemberDto memberDto,
			HttpSession session) {
		MemberDto findDto = sqlSession.selectOne(
					"chat.get", memberDto.getMemberId());
		if(findDto == null) return "redirect:testhome";
		
		boolean judge = memberDto.getMemberPw()
											.equals(findDto.getMemberPw()); //암호화 일때는 인코더의 매치스 이용해야함(이퀄즈 사용 불가능)
		if(judge) { // judge가 true면 패스워드가 일치하면 
			session.setAttribute("loginId", findDto.getMemberId());
			session.setAttribute("loginName", findDto.getMemberName());
			session.setAttribute("loginStatus", findDto.getMemberStatus());
		}
		return "redirect:testhome";
	}
	
	@GetMapping("/testlogout")
	public String testLogout(HttpSession session) {
		session.invalidate();
		return "redirect:testhome";
	}
	
	
	
	//채팅리스트
	@GetMapping("/list")
	public String chatList() {
		return "chat/list";
	}
	
	//채팅방 {room 번호}
	@GetMapping("/room/{roomNo}")
	public String chatRoom(@PathVariable String roomNo, Model model) {
		model.addAttribute("roomNo", roomNo);
		return "chat/room";
	}
}
