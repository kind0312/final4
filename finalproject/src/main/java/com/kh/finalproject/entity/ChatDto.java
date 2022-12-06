package com.kh.finalproject.entity;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChatDto {
	
	private int chatNo;
	private String roomNo; //룸번호 String
	private String memberId;
	private Date chatCreateAt;
	private String chatMessage;
	private String chatMessageStatus; //읽음 상태 N.Y
}
