package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PayReadyRequestVO {
	private String partner_order_id; //가맹점 주문번호
	private String partner_user_id; //가맹점 회원id
	private String item_name; //상품명
	private int total_amount; //상품가격
}
