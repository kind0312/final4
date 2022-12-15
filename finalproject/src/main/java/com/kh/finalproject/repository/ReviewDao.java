package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainingListVO;

public interface ReviewDao {
	
	//시퀀스 생성
	int sequence();
	
	//이용후기 작성
	int insert(ReviewDto reviewDto);
	
	//이용 완료 조회
	TrainingDto one(String memberId);
	TrainingListVO selectOne(TrainingDto trainingDto);
	
	//이용후기 상세정보
	ReviewDto detail(int reviewNo);
	
	//이용후기 목록
	List<ReviewVO> reviewList();
	
	//이용후기 작성여부
	ReviewDto writed(int trainingNo);

}
