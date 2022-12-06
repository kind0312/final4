package com.kh.finalproject.repository;


import java.util.List;

import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListVO;

public interface TrainerDao {

	//훈련사 예약요청목록 메소드
	List<TrainingDto> requestList(int trainerNo);

	//훈련사 목록보기 메소드
	List<TrainerListVO> selectTrainerList();
	
	//훈련사 디테일 메소드
	TrainerListVO selectOne(String memberId);
	
	//훈련사 리뷰 메소드
	List<ReviewVO> selectTrainerReview(int trainerNo);
	

	//훈련사테이블(자기소개) insert 메소드
	void insert(TrainerDto trainerDto);
	
	//훈련사테이블(자기소개) update 수정 메소드
	//boolean update(TrainerDto trainerDto);
	

}
