package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.TrainingDto;

public interface TrainingDao {
	//등록
	//수정
	//진행예약 조회
	List<TrainingDto> ingList(String memberId);
	//지난예약 조회
	List<TrainingDto> endList(String memberId);
	//삭제
}
