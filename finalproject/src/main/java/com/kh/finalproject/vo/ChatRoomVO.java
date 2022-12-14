package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ChatRoomVO {

	private String memberId;
	private String memberName;
	private int chatNo;
	private String roomNo;
	private Date chatCreateAt;
	private String chatMessage;
	private String chatMessageStatus;
	private int filesNo;
}
