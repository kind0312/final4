package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingDto {
	
	private int trainingNo;
	private String memberId;
	private Date trainingDate;
	private Date trainingStartTime;
	private String trainingBasicAddress;
	private String trainingDetailAddress;
	private String trainingMemo;
	private String trainingStatus;
	private Date trainingChangeDate;
	
}
