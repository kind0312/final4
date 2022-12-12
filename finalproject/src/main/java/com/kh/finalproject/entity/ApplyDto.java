package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ApplyDto {
	private int applyNo;
	private String memberId;
	private Date applyDate;
	private String applyMotive;
	private String applySmoke;
	private String applyActive;
	private String applyLicense;
	private String applyStatus;
}
