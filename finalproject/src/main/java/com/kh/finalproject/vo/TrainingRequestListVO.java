package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingRequestListVO {
	
	//training
	private int trainingNo;
	private String memberId;
	private Date trainingDate;
	private String trainingStartTime;
	private String trainingBasicAddress;
	private String trainingStatus;
	
	//pet
	private int petNo;		
	private String petName;	
	
	//files
	private int filesNo;
}
