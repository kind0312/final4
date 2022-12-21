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
import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.TrainerDao;
import com.kh.finalproject.vo.ChatListVO;
import com.kh.finalproject.vo.ChatPartnerSearchVO;
import com.kh.finalproject.vo.ChatPartnerVO;
import com.kh.finalproject.vo.ChatRoomVO;
import com.kh.finalproject.vo.ChatUpdateVO;
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
		
	
	//일반회원 채팅리스트
	@GetMapping("/list")
	public String chatList( HttpSession session , Model model) {
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("sessionId", memberId); // 로그인 한 사람 id
		
		List<ChatListVO> listVO = chatDao.chatRoomList(memberId); //아이디로 리스트 찾아오기(일반회원 기준)		
		
		model.addAttribute("chatList" , listVO);
		
		return "chat/list";
	}
	
	//트레이너 기준 채팅 리스트
	@GetMapping("/list_trainer")
	public String chatListTrainer(HttpSession session , Model model) {
		String memberId = (String) session.getAttribute(SessionConstant.ID); //트레이너 아이디
		model.addAttribute("sessionId", memberId); // 로그인 한 사람 id
		
		List<ChatListVO> listTrainerVO = chatDao.chatRoomListTrainer(memberId); //아이디로 리스트 찾아오기(일반회원 기준)
		
		model.addAttribute("chatList", listTrainerVO);
		
		return "chat/list_trainer";
	}
	
	
	
	
	//채팅방 {room 번호}
	@RequestMapping("/room")
	public String chatRoom(@RequestParam String roomNo, Model model
			,@ModelAttribute RoomDto roomDto	, HttpSession session		
			) {
		
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		model.addAttribute("myId", memberId);
		
		//파라미터에서 roomNo
		model.addAttribute("roomNo", roomNo);
		
		//채팅내역
		List<ChatRoomVO> chat = chatDao.chatRoom(roomNo);				
		
		model.addAttribute("chatHistory", chat );		
		
		ChatPartnerSearchVO searchVO = ChatPartnerSearchVO.builder().memberId(memberId).roomNo(roomNo).build();
		
		// 채팅 상대 정보
		ChatPartnerVO partner = chatDao.chatPartner(searchVO);		 
		model.addAttribute("partner", partner);
		//partner.filesNo; 상대방 이미지 파일
		
		// 내 img filesNo 정보
		int myfilesNo = memberDao.findFileNo(memberId);
		model.addAttribute("myimg", myfilesNo);
		
		// 채팅방 들어갈때 상대 메시지 읽음 표시 update
		String partnerId = partner.getMemberId(); //상대 아이디
		//메소드 추가해야함 
		ChatUpdateVO chatUpdateVO = ChatUpdateVO
				.builder()
					.memberId(partnerId)
					.roomNo(roomNo)
				.build();
		
		chatDao.chatUpdate(chatUpdateVO);
		
		return "chat/room";
	}
	
	//채팅방 {room 번호}
		@RequestMapping("/room_trainer")
		public String chatRoomTrainer(@RequestParam String roomNo, Model model
				,@ModelAttribute RoomDto roomDto	, HttpSession session		
				) {
			
			String memberId = (String) session.getAttribute(SessionConstant.ID);  //트레이너 memberId
			model.addAttribute("myId", memberId);
			
			//파라미터에서 roomNo
			model.addAttribute("roomNo", roomNo);
			
			//채팅내역
			List<ChatRoomVO> chat = chatDao.chatRoom(roomNo);		
			model.addAttribute("chatHistory", chat );		
			
			ChatPartnerSearchVO searchVO = ChatPartnerSearchVO.builder().memberId(memberId).roomNo(roomNo).build();
			
			// 채팅 상대 정보
			ChatPartnerVO partner = chatDao.chatPartner(searchVO);		 
			model.addAttribute("partner", partner);
			
			return "chat/room_trainer";
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
		
		//chat테이블에도 메세지 하나 넣어줘야함
		chatDao.insertMessage(ChatDto.builder()
				.roomNo(seqNo)
				.memberId(trainerId)
				.chatMessage("안녕하세요! "+"훈련사 " + trainerDto.getMemberName() +"입니다." + " 문의사항이 있으시다면 남겨주세요.")				
				.build()				
				);	
		
		System.out.println("새로방만들기 성공");
		return "redirect:/chat/room?roomNo="+seqNo;
		}
	}
	
	
	
}
