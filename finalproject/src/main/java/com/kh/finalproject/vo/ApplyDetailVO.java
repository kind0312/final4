package com.kh.finalproject.vo;

import java.sql.Date;

import com.kh.finalproject.entity.AdminDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ApplyDetailVO {
	private int applyNo;
	private Date applyDate;
	private String applyMotive;
	private String applySmoke;
	private String applyActive;
	private String applyLicense;
	private String applyStatus;
	private String memberName;
	private String memberId;
	private String memberGender;
	private String memberEmail;
	private String memberTel;
	
	
	
	
}
