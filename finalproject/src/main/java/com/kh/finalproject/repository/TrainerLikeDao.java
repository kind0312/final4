package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.LikeDto;
import com.kh.finalproject.vo.LikeListVO;

public interface TrainerLikeDao {

	void insert(LikeDto dto); //좋아요 등록
	void delete(LikeDto dto); //좋아요 취소 시 삭제
	boolean check(LikeDto dto); //좋아요 여부 확인(좋아요 했으면 1, 아니면 0)
	int count(int trainerNo); // 좋아요 개수 조회
	void refresh(int trainerNo); //trainer 테이블 좋아요 개수 업데이트
	List<LikeListVO> likeList(String memberId);
}
