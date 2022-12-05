package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChatUserDto {

	private String memberId;
	private String roomNo; // 방번호 String으로 줌 
	private String memberName;
	private String memberStatus;
}
