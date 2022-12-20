package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainingUsageVO {
	
	private String memberId;
	private String memberName;
	private int trainingNo;
	private Date trainingDate;
	private String trainingStatus;
	
	
	
	
	

}
