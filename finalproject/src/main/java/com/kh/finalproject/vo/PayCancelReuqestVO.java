package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PayCancelReuqestVO {
	private String tid;
	private int cancel_amount;
	private int cancel_tax_free_amount;
}
