package com.kh.finalproject.repository;


import java.util.List;

import com.kh.finalproject.entity.ApplyDto;
import com.kh.finalproject.vo.ApplyDetailVO;

public interface ApplyDao {
	//지원자 목록보기
	List<ApplyDto>selectList();
	
	//지원자 상세
	ApplyDto selectOne(int applyNo);
	//지원자 상세(ApplyDetailVO로 반환)
	ApplyDetailVO detailOne(int applyNo);
	
	//수정
	//상태(승인)변경
	boolean status1(String memberId);
	//상태(반려)변경
	boolean status2(String memberId);

	//시퀀스 생성
	int sequence();
	
	//훈련사 등록
	void insert(ApplyDto applyDto);
	
	//훈련사 지원여부확인
	ApplyDto selectone(String memberId);





}
