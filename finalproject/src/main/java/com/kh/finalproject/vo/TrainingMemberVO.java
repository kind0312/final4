package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingMemberVO {
	
	
	//private String memberName;
	//private String memberId;
	
	private int trainingNo;
    private String trainingDate;
   
	private int trainingPurchasePrice;
	

	
	private int petNo;
	private String petType;
	private String petName;
	private String petGender;
	private String petBreed;
	private Date petBirth;
	private String petNeutralization;
	
	private int filesNo;
	
	
	

}
