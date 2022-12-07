package com.kh.finalproject.vo;

import java.sql.Date;

public class MemberDetailVO {
	//회원 아이디
	private String memberId;
	
	//회원정보
	private String memberName, memberEmail,memberJoindate,memberGender,memberTel;
	
	//반려동물 정보
	private String petType,petName,petNeutralization;
	private Date petBirth;
	
	
}
