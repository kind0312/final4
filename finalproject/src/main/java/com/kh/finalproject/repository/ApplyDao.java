package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ApplyDto;

public interface ApplyDao {
	//지원자 목록보기
	List<ApplyDto>selectList();
	
	//지원자 상세
	ApplyDto selectOne(int applyNo);
	
	//지원자 수정기능

     //eidt(ApplyDto applyDto);
	//ApplyDto update(int applyNo);
	boolean update(ApplyDto dto);
	boolean update2(ApplyDto dto);
	//반환형 이름 (매개변수)

	

}
