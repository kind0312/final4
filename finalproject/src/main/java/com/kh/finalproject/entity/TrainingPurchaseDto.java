package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingPurchaseDto {
	private int trainingPurchaseNo;
	private int trainingNo;
	private int trainingPurchasePrice;
	private String trainingPurchasePayment;
	private Date trainingPurchaseDate;
}
