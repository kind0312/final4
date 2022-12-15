package com.kh.finalproject.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TraingUsageVO {
	
	private int memberId;
	private String memberName;
	private int traingNo;
	private Date traingDate;
	private String traingStatus;
	

}
