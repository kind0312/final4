package com.kh.finalproject.vo.channel;

import java.util.Date;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Chat {
	
	private int filesNo;
	private int chatNo;
	private String roomNo; //룸번호 String
	private String memberId;
	private Date chatCreateAt;
	private String chatMessage;
	private String chatMessageStatus; //읽음 상태 N.Y
}
