package com.kh.finalproject.vo.channel;

import java.io.IOException;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * 
 * 사용자 1명의 정보를 저장하는 클래스
 * -  사용자에게 메세지를 보내는 기능
 * 
 * */
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class User {

	private String memberId;
	private String memberName;
	private String memberStatus;
	private WebSocketSession session;
	
	public boolean is (String memberId) {
		if(memberId == null) return false;
		if(this.memberId == null) return false;
		return this.memberId.equals(memberId);
	}
	
	
	public void send(TextMessage message) throws IOException {
		session.sendMessage(message);
	}
}
