package com.kh.finalproject.controller;

import java.io.Console;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.repository.ChatDao;



@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatDao chatDao;
		
	
	//채팅리스트
	@GetMapping("/list")
	public String chatList() {
		return "chat/list";
	}
	
	//채팅방 {room 번호}
	@RequestMapping("/room/{roomNo}")
	public String chatRoom(@PathVariable String roomNo, Model model, @ModelAttribute RoomDto roomDto) {
		//roomNo를 어디서 가져올까?	
		model.addAttribute("roomNo", roomNo);
		return "chat/room";
	}
	
	
	
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(@ModelAttribute RoomDto roomDto, ChatUserDto chatUserDto, HttpSession session) {
		
		String seqNo = chatDao.createRoomSeq();  //채팅방 시퀀스번호 생성
		
		System.out.println(seqNo);
		
		//채팅room 테이블에 생성된 테이블 정보 insert
		chatDao.createRoom(roomDto.builder()
				.roomNo(seqNo)
				.roomCreateAt(roomDto.getRoomCreateAt())
				.roomUpdateAt(roomDto.getRoomUpdateAt())
				.build()
				);
		//해당 방에 들어가는 유저 정보 chat_user테이블에 정보 insert
		chatDao.insertChatUser(chatUserDto.builder()
				.memberId((String)session.getAttribute("loginId"))
				.roomNo(seqNo)
				.memberName((String)session.getAttribute("loginName"))
				.memberStatus((String)session.getAttribute("loginStatus"))
				.build());
		//그럼 훈련사도 같은 방에 memberId가 저장되어야 하는데...		
		return "방 생성 완료";
	}
	
	
	
	
}
