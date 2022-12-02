package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
}
