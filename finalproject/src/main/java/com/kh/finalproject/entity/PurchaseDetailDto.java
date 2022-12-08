package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PurchaseDetailDto {
	private int purchaseDetailNo;
	private int trainingPurchaseNo;
	private int purchaseDetailPetNo;
	private int purchaseDetailPrice;
	private String purchaseDetailStatus;
}
