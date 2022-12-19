package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ChatListVO {

	private int chatNo;
	private String roomNo;
	private Date chatCreateAt;
	private String chatMessage;
	private String memberName;
	private int filesNo;
	private String chatMessageStatus; 
	private String memberId; //마지막 채팅친 사람 id
}
