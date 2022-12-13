package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingListVO {
	private String memberId;
	
	private int trainingNo;
	private Date trainingDate;
	private String trainingStartTime;
	private String trainingStatus;
	
	private int trainerNo;
	
	private int filesNo;
}
