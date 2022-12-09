package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointDto;

public interface PointDao {
	//시퀀스 발급
	int sequence();
	//등록
	void insert(PointDto pointDto);
	//예약취소 시 pointDate가 null값이 들어가는 처리를 위해 insert문 하나 더 추가ㅠ
	void cancelInsert(PointDto pointDto);
	
	//목록
	List<PointDto> selectList(String memberId);
	//총 개수
	public int count(String memberId);
	
}
