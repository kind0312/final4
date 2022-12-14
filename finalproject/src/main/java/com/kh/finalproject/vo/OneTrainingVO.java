package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class OneTrainingVO {
	private String memberId;
	private int trainingNo;
	private Date trainingDate;
	private String trainingStartTime;
	private String trainingBasicAddress;
	private String trainingDetailAddress;
	private String trainingMemo;
	private String trainingStatus;
	private Date trainingChangeDate;
	
	private String trainingDetailPetName;
	
	private int trainerNo;
}
