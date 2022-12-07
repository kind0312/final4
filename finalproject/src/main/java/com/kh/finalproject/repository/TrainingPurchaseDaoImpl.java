package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PurchaseDetailDto;
import com.kh.finalproject.entity.TrainingPurchaseDto;

@Repository
public class TrainingPurchaseDaoImpl implements TrainingPurchaseDao{
	
	@Autowired
	private SqlSession sqlSession;

	//훈련서비스 고유번호로 결제내역 단일조회
	@Override
	public TrainingPurchaseDto selectOne(int trainingNo) {
		return sqlSession.selectOne("training_purchase.selectOne",trainingNo);
	}

	//결제 고유번호로 훈련서비스 상세내역 조회
	@Override
	public PurchaseDetailDto detailSelectOne(int trainingPurchaseNo) {
		return sqlSession.selectOne("training_purchase.detailSelectOne",trainingPurchaseNo);
	}
	
	
	

}
