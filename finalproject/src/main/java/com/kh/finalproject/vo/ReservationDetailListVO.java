package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationDetailListVO {
	
	private String memberId;
	private String memberName;
	
	private int trainingNo;
	private Date trainingDate;
	private String trainingStartTime;
	private String trainingBasicAddress;
	private String trainingDetailAddress;
	private String trainingMemo;
	private String trainingStatus;
	private Date trainingChangeDate;
	
	private int trainingPurchasePrice;
	
	private int petNo;
	private String petType;
	private String petName;
	private String petGender;
	private String petBreed;
	private Date petBirth;
	private int petWeight;
	private String petNeutralization;
	
	private int filesNo;
	
	//private String trainingDetailPetName;
}
