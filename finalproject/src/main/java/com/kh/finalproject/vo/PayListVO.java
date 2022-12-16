package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayListVO {
	private int pointPurchaseNo;
	private String memberId;
	private int itemNo;
	private int pointPurchasePrice;
	private Date pointPurchaseDate;
	private String pointPurchasePayment;
	private String pointPurchaseStatus;
	private String tid;
	private String itemName;
}
