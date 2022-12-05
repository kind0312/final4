package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class RoomDto {
	
	private int roomNo;
	private String memberId;
	private Date roomCreateAt;
	private Date roomUpdateAt;
}
