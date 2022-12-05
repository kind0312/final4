package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PetDto;

public interface PetDao {
	//등록
	void insert(PetDto petDto);
	//조회
	List<PetDto> selectList(String memberId);
	PetDto selectOne(int petNo);
	//수정
	boolean update(PetDto petDto);
	//삭제
	boolean delete(int petNo);
}
