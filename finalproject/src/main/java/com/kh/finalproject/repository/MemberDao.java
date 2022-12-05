package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	
	//수정(결제 후 포인트 증가 처리)
	boolean pointPlus(MemberDto memberDto);
}
