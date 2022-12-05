package com.kh.finalproject.repository;

import com.kh.finalproject.entity.FilesDto;
import com.kh.finalproject.entity.PetImgDto;

public interface FilesDao {
	//시퀀스 선발급
	int sequence();
	//등록
	void insert(FilesDto filesDto);
	//조회
	FilesDto find(int filesNo);
	
}
