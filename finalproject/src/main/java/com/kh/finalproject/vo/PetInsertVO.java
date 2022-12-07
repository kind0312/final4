package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PetInsertVO {
	// PetDto 변수
	private int petNo;
	private String memberId;
	private String petType;
	private String petName;
	private String petGender;
	private String petBreed;
	private Date petBirth;
	private int petWeight;
	private String petNeutralization;
	
	//펫, 첨부파일 연결테이블 추가하기 위한 변수
	private int filesNo;
}
