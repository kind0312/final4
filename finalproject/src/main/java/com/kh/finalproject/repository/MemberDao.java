package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MemberImgDto;
import com.kh.finalproject.vo.MemberListSearchVO;
import com.kh.finalproject.vo.MemberListVO;


public interface MemberDao {
	
	//등록
	//회원 등록(비밀번호 암호화 하여 등록)
	void insert(MemberDto memberDto);
	//회원, 첨부파일 연결테이블 등록
	void memberProfileInsert(MemberImgDto memberImgDto);
	//로그인
	boolean login(MemberDto memberDto);
	
	//조회
    //회원 검색
	List<MemberListVO>selectList(MemberListSearchVO vo);
	//회원 조회
	MemberDto selectOne(String memberId);
	//회원 프로필 이미지 파일 번호 찾기
	int findFileNo(String memberId);
	
	//수정
	//결제 후 포인트 증가 처리
	boolean pointPlus(MemberDto memberDto);
	//프로필 정보수정
	boolean profileEdit(MemberDto memberDto);
     //프로필 첨부파일 수정
	boolean profileImgEdit(MemberImgDto memberImgDto);

}
