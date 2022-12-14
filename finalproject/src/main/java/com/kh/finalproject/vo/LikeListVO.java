package com.kh.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class LikeListVO {

	private int trainerNo;
	private String memberId;
	private String trainerProfile;
	private String trainerProfileContent;
	private int trainerLike;
	private int filesNo;
	private String memberName;
}
