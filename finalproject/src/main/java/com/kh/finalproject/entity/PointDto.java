package com.kh.finalproject.entity;

import java.sql.Date;

import javax.validation.constraints.NegativeOrZero;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PointDto {
	private int pointNo;
	private String memberId, pointStatus;
	private int pointPrice;
	private Date pointDate;
}
