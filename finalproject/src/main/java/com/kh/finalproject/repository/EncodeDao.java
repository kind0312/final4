package com.kh.finalproject.repository;

import com.kh.finalproject.entity.EncodeDto;

public interface EncodeDao {

	//암호화 등록
	void insert(EncodeDto encodeDto);
	
	//로그인
	boolean login(EncodeDto encodeDto);
	
	//암호화 단일조회
	EncodeDto find(String memberId);	
}
