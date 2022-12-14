package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.entity.PetImgDto;

import com.kh.finalproject.vo.MemberDetailVO;

import com.kh.finalproject.vo.PetInsertVO;


public interface PetDao {
	//시퀀스 선발급
	int sequence();
	
	//등록
	void insert(PetDto petDto);
	
	//조회
	List<PetDto> selectList(String memberId);
	PetDto selectOne(int petNo);
	int selectFileNo(int petNo);
	//펫목록 동기 출력위한 메소드
	List<PetInsertVO> list(String memberId);
	
	//수정
	boolean update(PetDto petDto);
	
	//삭제
	boolean delete(int petNo);
	

	//펫, 첨부파일 연결테이블 등록 - petInsertVO
	void petProfileInsert(PetInsertVO petInsertVO);
	//펫, 첨부파일 연결테이블 수정 - petInsertVO
	void petProfileUpdate(PetInsertVO petInsertVO);
	
	
	
}
