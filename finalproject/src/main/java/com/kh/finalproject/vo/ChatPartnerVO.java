package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ChatPartnerVO {
	
	private String memberId; //채팅상대 id
	private String memberName; //채팅상대 이름
	private int filesNo; //채팅상대 img 파일 번호

}
