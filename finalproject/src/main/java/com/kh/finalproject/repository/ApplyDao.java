package com.kh.finalproject.repository;


import java.util.List;

import com.kh.finalproject.entity.ApplyDto;

public interface ApplyDao {
	//지원자 목록보기
	List<ApplyDto>selectList();
	
	//지원자 상세
	ApplyDto selectOne(int applyNo);
	
	//지원자 수정기능
	boolean update(ApplyDto dto);
	boolean update2(ApplyDto dto);
	

	//시퀀스 생성
	int sequence();
	
	//훈련사 등록
	void insert(ApplyDto applyDto);
	
	//훈련사 지원여부확인
	ApplyDto selectone(String memberId);





}
