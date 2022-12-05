package com.kh.finalproject.vo.channel;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;

import lombok.extern.slf4j.Slf4j;

/*
 * 
 * 채팅방 클래스
 * - 사용자(User)를 저장할 수 있도록 구성
 * - 입장, 퇴장, 검색, 메세지 기능이 있어야 한다
 * 
 * 
 * */
@Slf4j
public class Room {
	//저장소의 형태는 set
	private Set<User> users = new CopyOnWriteArraySet<>();
	
	//입장
	public void enter(User user) {
		users.add(user);
		log.debug("-->방 입장 : {}", user);
	}
	
	//퇴장
	public void leave(User user) {
		users.remove(user);
		log.debug("--> 방 퇴장 : {}", user);
	}
	
	//검색
	public User search(String memberId) {
		for(User user: users) {
			if(user.is(memberId)) return user;
		}
		return null;
	}
	//귓속말은 여기다 구현
	
	
	//메세지 보내기
	public void broadcast(TextMessage message) throws IOException {
		for(User user : users) {
			user.send(message);
		}
	}
	
	//유저 수
	public int size() {
		return users.size(); //방에 인원이 몇명있는지 알수있음
	}
	
}
