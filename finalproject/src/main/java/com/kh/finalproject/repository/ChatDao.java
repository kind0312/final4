package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.RoomDto;
import com.kh.finalproject.vo.ChatPartnerSearchVO;
import com.kh.finalproject.vo.ChatPartnerVO;
import com.kh.finalproject.vo.ChatRoomVO;
import com.kh.finalproject.vo.SearchRoomVO;



public interface ChatDao {

	String createRoomSeq(); //룸 번호 시퀀스 생성
	
	//room 생성 - room테이블 insert
	void createRoom(RoomDto roomDto);
	
	//채팅유저 테이블 insert
	void insertChatUser(ChatUserDto chatUserDto);
	
	//채팅내용 insert
	void insertMessage(ChatDto chatDto); 
	
	// list 불러오기
	List<ChatDto> chatSearch(String roomNo); 
	
	//기존에 있는 채팅룸 불러오기
	String searchRoomVO(SearchRoomVO searchRoomVO);
	
	//채팅방 리스트(일반회원)
	List<ChatUserDto> chatRoomList(String memberId);
	
	//채팅방안에 들어갔을때 나올 내역
	List<ChatRoomVO> chatRoom(String roomNo);
	
	//채팅방 상태 아이디,이름,프로필정보 -> 리스트 아님
	ChatPartnerVO chatPartner(ChatPartnerSearchVO chatPartnerSearchVO);
	


	
}
