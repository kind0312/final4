package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointPurchaseDto;
import com.kh.finalproject.vo.PayListVO;

public interface PointPurchaseDao {
	//시퀀스 선발급
	int sequence();

	//등록
	void insert(PointPurchaseDto pointPurchaseDto);
	
	//조회
	List<PayListVO> selectList(String memberId);
	PayListVO selectOne(int pointPurchaseNo);
	
}
