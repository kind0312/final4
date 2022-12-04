package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointDto;

public interface PointDao {
	//등록
	void insert(PointDto pointDto);
	//목록
	List<PointDto> selectList(String memberId);
	
}
