package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewVO {

	private int reviewNo;
	private int trainingNo;
	private int trainerNo;
	private String memberId;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewWriteTime;
	private Date reviewUpdateTime;
	private int reviewGood;
}
