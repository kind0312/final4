package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class TrainerDto {

	private int trainerNo;
	private String memberId;
	private int applyNo;
	private String trainerProfile;
	private String trainerProfileContent;
	private int trainerLike;
}
