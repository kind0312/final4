package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;



public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	
	//회원 목록
	//List<MemberDto> selectList();
	
	//검색
	List<MemberListVO>selectList(MemberListSearchVO vo);
	
	//회원 검색
	//List<MemberDto> seletList(String type,String keyword);
	//정렬
	//List<MemberDto> complexSearch(MemberSearchVO vo);
	
	//회원상세
	MemberDto selectOne(String memeberId);

	
}
