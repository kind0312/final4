package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CalendarVO {
	private Date trainingDate;
	private int trainingNo;
	private int trainerNo;
	private String trainingStatus;
}
