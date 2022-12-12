package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PetDetailListVO {
	
	
	private int petNo;	
	private String memberId;
	private String petType;
	private String petName;
	private String petGender;
	private String petBreed;
	private Date petBirth;
	private int petWeight;
	private String petNeutralization;
	private int filesNo;
	

}
