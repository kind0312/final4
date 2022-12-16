package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayOrderResponseVO {
	private String tid;
	private String cid;
	private String status;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private AmountVO amount;
	private AmountVO canceled_amount;
	private AmountVO cancel_available_amount;
	private String item_name;
	private String item_code;
	private int quantity;
	private Date created_at;
	private Date cancel_at;
	private SelectedCardInfoVO selected_card_info;
	private PaymentActionDetailsVO[] payment_action_details;
}
