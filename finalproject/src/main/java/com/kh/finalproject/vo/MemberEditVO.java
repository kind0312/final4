package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberEditVO {
	//MemberDto 변수
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberPost;
	private String memberBaseAddress;
	private String memberDetailAddress;
	
	//회원, 첨부파일 연결테이블 추가하기 위한 변수
	private int filesNo;
}
