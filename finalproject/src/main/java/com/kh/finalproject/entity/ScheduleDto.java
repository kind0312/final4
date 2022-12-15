package com.kh.finalproject.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ScheduleDto {
	
	private int scheduleNo;
	private int trainerNo;
	private Date scheduleDate;
	private int trainingNo;

}
