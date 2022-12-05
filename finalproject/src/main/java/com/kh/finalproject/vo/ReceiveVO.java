package com.kh.finalproject.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties  //3개가 다 오지않아도 변환
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReceiveVO {

	private int type;
	private String room;
	private String text;
}
