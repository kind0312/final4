package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointPurchaseDto;
import com.kh.finalproject.vo.PaginationListSearchVO;
import com.kh.finalproject.vo.PayListVO;

public interface PointPurchaseDao {
	//시퀀스 선발급
	int sequence();

	//등록
	void insert(PointPurchaseDto pointPurchaseDto);
	
	//조회
	List<PayListVO> selectList(String memberId);
	PayListVO selectOne(int pointPurchaseNo);
	
	//수정
	boolean update(int pointPurchaseNo);
	
	
	//페이징
	//통합조회
	List<PayListVO> listAll(PaginationListSearchVO vo);
	// - 전체 조회
	List<PayListVO> list(PaginationListSearchVO vo);
	// - 검색 조회
	List<PayListVO> search(PaginationListSearchVO vo);

	// - 조회 유형에 따른 총 조회 결과 갯수
	int count(PaginationListSearchVO vo);
	// - 전체 조회시 총 조회 결과 갯수
	int listCount(String memberId);
	// - 검색 조회시 총 조회 결과 갯수
	int searchCount(PaginationListSearchVO vo); 
}
