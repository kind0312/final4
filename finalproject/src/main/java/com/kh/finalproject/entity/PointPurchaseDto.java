package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PointPurchaseDto {
	private int pointPurchaseNo;
	private String memberId;
	private int itemNo;
	private int pointPurchasePrice;
	private Date pointPurchaseDate;
	private String pointPurchasePayment;
	private String pointPurchaseStatus;
	private String tid;
}
