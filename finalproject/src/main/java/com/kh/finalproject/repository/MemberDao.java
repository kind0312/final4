package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;

import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;




import com.kh.finalproject.entity.MemberImgDto;


public interface MemberDao {
	
	//회원 등록
	void insert(MemberDto memberDto);
	
    //회원 검색
	List<MemberListVO>selectList(MemberListSearchVO vo);
	
	
	//회원, 첨부파일 연결테이블 등록
	void memberProfileInsert(MemberImgDto memberImgDto);
	

	//회원 조회
	MemberDto selectOne(String memberId);
	
	//수정(결제 후 포인트 증가 처리)
	boolean pointPlus(MemberDto memberDto);

     //회원 프로필 이미지 파일 번호 찾기
	int findFileNo(String memberId);

	
	//member_img테이블 delete 메소드
	boolean memberImgDelete(String memberId);
}
