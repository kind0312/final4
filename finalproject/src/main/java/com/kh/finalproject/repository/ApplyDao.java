package com.kh.finalproject.repository;

import com.kh.finalproject.entity.ApplyDto;

public interface ApplyDao {

	//시퀀스 생성
	int sequence();
	
	//훈련사 등록
	void insert(ApplyDto applyDto);
	
	//훈련사 지원여부확인
	ApplyDto selectone(String memberId);
}
