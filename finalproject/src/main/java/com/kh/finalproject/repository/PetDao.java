package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PetDto;
import com.kh.finalproject.entity.PetImgDto;
import com.kh.finalproject.vo.PetInsertVO;

public interface PetDao {
	//시퀀스 선발급
	int sequence();
	//등록
	void insert(PetDto petDto);
	//조회
	List<PetDto> selectList(String memberId);
	PetDto selectOne(int petNo);
	//수정
	boolean update(PetDto petDto);
	//삭제
	boolean delete(int petNo);
	
	//펫, 첨부파일 연결테이블 등록 - vo만들어서 처리!!!
	void petProfileInsert(PetInsertVO petInsertVO);
}
