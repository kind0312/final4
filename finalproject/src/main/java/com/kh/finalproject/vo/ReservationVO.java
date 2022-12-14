package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationVO {
	
	private int trainingNo;
	private String memberId;
	private Date trainingDate;
	private String trainingStartTime;
	private String trainingBasicAddress;
	private String trainingDetailAddress;
	private String trainingMemo;
	private String trainingStatus;
	private Date trainingChangeDate;
	private String trainingPetDetailName;
	private int trainingPurchaseNo;
	private int trainingPurchasePrice;
	private String trainingPurchasePayment;
	private Date trainingPurchaseDate;
	private int purchaseDetailNo;
	private String purchaseDetailPetName;
	private int purchaseDetailPrice;
	private String purchaseDetailStatus;
	private int trainerNo;
}
