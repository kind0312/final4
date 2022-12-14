package com.kh.finalproject.entity;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class LikeDto {
	private String memberId;
	private int trainerNo;
	private Date likeDate;
}
