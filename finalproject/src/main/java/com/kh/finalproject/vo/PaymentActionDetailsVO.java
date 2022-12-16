package com.kh.finalproject.vo;

import lombok.Data;

@Data
public class PaymentActionDetailsVO {
	private String aid;
	private String approved_at;
	private int amount;
	private int point_amount;
	private int discount_amount;
	private int green_deposit;
	private String payment_action_type;
	private String payload;
}
