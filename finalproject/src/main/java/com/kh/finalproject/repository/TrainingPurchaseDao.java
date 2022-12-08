package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PurchaseDetailDto;
import com.kh.finalproject.entity.TrainingPurchaseDto;

public interface TrainingPurchaseDao {

	//등록
	
	//조회
	//훈련서비스 고유번호로 결제내역 단일조회
	TrainingPurchaseDto selectOne(int trainingNo);
	//결제 고유번호로 훈련서비스 상세내역 조회
	List<PurchaseDetailDto> detailSelectOne(int trainingPurchaseNo);
	
	//수정
	//결제 고유번호로 거래상태 취소로 변경
	boolean statusChange(int trainingPurchaseNo);

}
