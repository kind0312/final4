package com.kh.finalproject.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalproject.constant.SessionConstant;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.SearchRoomVO;



@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private TrainerDao trainerDao;
	
	@Autowired
	private MemberDao memberDao;
		
	
	//채팅리스트
	@GetMapping("/list")
	public String chatList(@ModelAttribute ChatUserDto chatUserDto, HttpSession session
			,Model model) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		
		List<ChatUserDto> list = chatDao.chatRoomList(memberId);
		model.addAttribute("chatList", list);
		
		List<String> listA = new ArrayList<String>();
		for(int i = 0; i < list.size(); i++) {
			listA.add(i, list.get(i).getMemberId());
			
		}
		
		
		
		System.out.println("listA =" + listA);
		
		return "chat/list";
	}
	
	//채팅방 {room 번호}
	@RequestMapping("/room")
	public String chatRoom(@RequestParam String roomNo, Model model, @ModelAttribute RoomDto roomDto) {
		//roomNo를 어디서 가져올까?	
		model.addAttribute("roomNo", roomNo);
		return "chat/room";
	}
	
	
	
	//채팅방 생성(일반회원 기준)
	//-> 기존에 채팅방이 있는지 확인
	//-> 있다면 방 번호를 알아내서 return 
	//-> 없다면 새로 생성해서 return 
	
	@RequestMapping("/enter") //채팅방 입장	
	public String enter(@ModelAttribute RoomDto roomDto, 
			@ModelAttribute ChatUserDto chatUserDto, 
			@ModelAttribute MemberDto memberDto,
			HttpSession session,
			@RequestParam int trainerNo) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		String trainerId = trainerDao.selectOneTrainerId(trainerNo);
		MemberDto memDto = memberDao.selectOne(memberId);
		MemberDto trainerDto = memberDao.selectOne(trainerId);
		
		// 1. 나(일반회원)과 해당 훈련사가 함께 있는 채팅방이 있는지 검색한다
		SearchRoomVO vo = SearchRoomVO
										.builder()
										.memberId(memberId)
										.trainerId(trainerId)
										.build();
		
		String searchRoomNo = chatDao.searchRoomVO(vo);
		System.out.println( " 룸 번호 " + searchRoomNo);
		
		//만약에 searchRoomNo가 null이 아니라면 방번호가 있는것 -> 해당 방으로 보내야함
		//return "/chat/room/" + "searchRoomNo";
		if(searchRoomNo != null) {					
			//return "${pageContext.request.contextPath}/chat/room?roomNo" + searchRoomNo;
			return "redirect:/chat/room?roomNo="+ searchRoomNo;
		}
		else {
		
		String seqNo = chatDao.createRoomSeq();  //채팅방 시퀀스번호 생성		
		//System.out.println(seqNo);
		
		//채팅room 테이블에 생성된 테이블 정보 insert
		chatDao.createRoom(roomDto.builder()
				.roomNo(seqNo)
				.roomCreateAt(roomDto.getRoomCreateAt())
				.roomUpdateAt(roomDto.getRoomUpdateAt())
				.build()
				);
		//해당 방에 들어가는 유저 정보 chat_user테이블에 정보 insert
		chatDao.insertChatUser(chatUserDto.builder()
				.memberId(memberId)
				.roomNo(seqNo)
				.memberName(memDto.getMemberName())
				.memberStatus(memDto.getMemberStatus())
				.build());
		//그럼 훈련사도 같은 방에 memberId가 저장되어야 하는데...	
		chatDao.insertChatUser(chatUserDto.builder()
				.memberId(trainerId)
				.roomNo(seqNo)
				.memberName(trainerDto.getMemberName())
				.memberStatus(trainerDto.getMemberStatus())
				.build());
		
		System.out.println("새로방만들기 성공");
		return "redirect:/chat/room?roomNo="+seqNo;
		}
	}
	
	
	
}
