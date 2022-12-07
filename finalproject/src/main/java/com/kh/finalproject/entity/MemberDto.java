package com.kh.finalproject.entity;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberTel;
	private String memberPost;
	private String memberBaseAddress;
	private String memberDetailAddress;
	private Date memberBirth;
	private String memberGender;
	private String memberStatus;
	private Long memberPoint;
	private Date memberJoinDate;
	private String memberGoodbye;
	private Date memberGoodbyeDate;
	
	//private List<String>sort;
}
