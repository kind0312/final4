package com.kh.finalproject.vo;

import java.util.Date;

import com.kh.finalproject.entity.ChatDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ChatPartnerSearchVO {

	private String memberId;
	private String roomNo;
}
