package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberDto;

public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	
	//회원 조회
	MemberDto selectOne(String memberId);
	
	//수정(결제 후 포인트 증가 처리)
	boolean pointPlus(MemberDto memberDto);
	
	//회원 프로필 이미지 파일 번호 찾기
	int findFileNo(String memberId);
}
