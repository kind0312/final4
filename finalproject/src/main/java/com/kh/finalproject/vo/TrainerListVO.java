package com.kh.finalproject.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainerListVO {

	private int cnt;
	private int avg;
	private int trainerNo;
	private String trainerProfile;
	private String trainerProfileContent;
	private String memberName;
	private String memberId;
	private String memberEmail;
	private String memberTel;
	private String memberGender;
}
