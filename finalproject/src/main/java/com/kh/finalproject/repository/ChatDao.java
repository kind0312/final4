package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.ChatUserDto;
import com.kh.finalproject.entity.RoomDto;


public interface ChatDao {

	//room 생성 - room테이블 insert
	void createRoom(RoomDto roomDto);
	
	//채팅유저 테이블 insert
	void insertChatUser(ChatUserDto chatUserDto);
	
	//채팅내용 insert
	void insertMessage(ChatDto chatDto); 
	
	// list 불러오기
	List<ChatDto> chatSearch(String roomNo); 
	
}
