package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;




public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	


	
	//회원 검색
	List<MemberListVO>selectList(MemberListSearchVO vo);
	
	
	

	
	
	


	

	//회원 조회
	MemberDto selectOne(String memberId);
	
	//수정(결제 후 포인트 증가 처리)
	boolean pointPlus(MemberDto memberDto);

}
