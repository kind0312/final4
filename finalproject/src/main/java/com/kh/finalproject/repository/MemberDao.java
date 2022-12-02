package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	
	//회원 목록
	List<MemberDto> selectList();
	//회원 검색
	List<MemberDto> seletList(String type,String keyword);

	
}
