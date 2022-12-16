package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.vo.PointListVO;

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
	
	
	
	
	//페이징
	//통합조회
	List<PointDto> listAll(PointListVO vo);
	// - 전체 조회
	List<PointDto> list(PointListVO vo);
	// - 검색 조회
	List<PointDto> search(PointListVO vo);

	// 추상 메소드 - 전체 조회와 검색 조회 시 총 조회 결과 갯수 (마지막 게시글의 rownum)
	// - 조회 유형에 따른 총 조회 결과 갯수
	int count(PointListVO vo);
	// - 전체 조회시 총 조회 결과 갯수
	int listCount(String memberId);
	// - 검색 조회시 총 조회 결과 갯수
	int searchCount(PointListVO vo); 
}
