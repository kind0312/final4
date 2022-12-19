package com.kh.finalproject.vo.channel;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.TextMessage;




/*
 * 
 * 방을 관리하는 채널 클래스
 * - 방을 관리할 수 있는 필드와 클래스
 * 
 * */

public class Channel {
	//방들을 이름으로 관리할 수 있는 저장소 
	//Map으로 구현
	
	Map<String, Room> rooms = Collections.synchronizedMap(new HashMap<>());
	//그냥 HashMap은 동기화가 안되기 때문에 syn붙여서 
	
	
	//입장 - 누가, 어느 방(name)에 
	public void join(User user, String name) { 
		if(!rooms.containsKey(name)) {//방이 없으면
			rooms.put(name, new Room());//방을 만든다
		}
		
		rooms.get(name).enter(user); //유저 입장		
	}
	
	
	
	//검색
	public String find(User user) {
		for(String name : rooms.keySet()) {//모든 방을 반복해서 뒤져서
			Room room = rooms.get(name);//방 하나를 꺼냄
			if(room.search(user.getMemberId()) != null) {//방에 해당 사용자가 있으면
				return name;
			}
		}
		return null;
	}
	
	//퇴장
	public void exit(User user) {
		String name = this.find(user);
		if(name == null) return;
		rooms.get(name).leave(user); //방을 나감
		
		if(rooms.get(name).size() == 0) { //방이 비었으면 삭제
			rooms.remove(name);
		}
	}
	
	//방에 메세지를 전송하는 기능
		//- (방 또는 사용자) 와 메세지를 알아야 한다
		public void send(User user, TextMessage message) throws IOException {
			String name = this.find(user);
			if(name != null) {
				rooms.get(name).broadcast(message);
			}
		}
}
