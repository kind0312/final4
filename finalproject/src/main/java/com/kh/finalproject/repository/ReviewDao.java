package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.PaginationListSearchVO;
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
	List<ReviewVO> reviewList();
	
	//전체 이용후기 상세
	ReviewVO fullDetail(int reviewNo);
	
	//페이지네이션
	//통합조회
	List<ReviewDto> listAll(PaginationListSearchVO vo);
	// - 전체 조회
	List<ReviewDto> list(PaginationListSearchVO vo);
	// - 검색 조회
	List<ReviewDto> search(PaginationListSearchVO vo);

	// - 조회 유형에 따른 총 조회 결과 갯수
	int count(PaginationListSearchVO vo);
	// - 전체 조회시 총 조회 결과 갯수
	int listCount(String memberId);
	// - 검색 조회시 총 조회 결과 갯수
	int searchCount(PaginationListSearchVO vo); 
}
