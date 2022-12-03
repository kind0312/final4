package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.Data;
@Data 
public class PayReadyResponseVO {
	private String tid; //결제고유번호
	private String next_redirect_mobile_url; //모바일 웹에서 접속했을 때 연결 url
	private String next_redirect_pc_url; //pc에서 접속했을때 연결 url
	private Date created_at; //결제 준비 요청시간
}
