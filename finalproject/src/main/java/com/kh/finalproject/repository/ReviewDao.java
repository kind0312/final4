package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewPaginationVO;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainingListVO;

public interface ReviewDao {
	
	//시퀀스 생성
	int sequence();
	
	//이용후기 작성
	int insert(ReviewDto reviewDto);
	
	//이용완료 조회
	TrainingListVO selectOne(TrainingDto trainingDto);
	
	//이용후기 상세정보
	ReviewDto detail(int reviewNo);
	
	//이용후기 작성여부
	ReviewDto writed(int trainingNo);
	
	//이용후기 수정
	boolean edit(ReviewDto reviewDto);
	
	//이용후기 삭제
	boolean delete(int reviewNo);
	
	//전체 이용후기 목록
	List<ReviewVO> reviewList(ReviewPaginationVO vo);
	
	List<ReviewVO> reviewInfinite();
	
	//전체 이용후기 상세
	ReviewVO fullDetail(int reviewNo);
	
	//리뷰의 총 개수
	int count();
}
