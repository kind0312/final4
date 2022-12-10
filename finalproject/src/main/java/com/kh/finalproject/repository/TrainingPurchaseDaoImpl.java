package com.kh.finalproject.repository;

import java.util.List;

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
	public List<PurchaseDetailDto> detailSelectOne(int trainingPurchaseNo) {
		return sqlSession.selectList("training_purchase.detailSelectOne",trainingPurchaseNo);
	}

	//결제 고유번호로 거래상태 취소로 변경
	@Override
	public boolean statusChange(int trainingPurchaseNo) {
		return sqlSession.update("training_purchase.statusChange", trainingPurchaseNo)>0;
	}

	@Override
	public void purchaseInsert(TrainingPurchaseDto trainingPurchaseDto) {

		sqlSession.insert("training_purchase.purchaseInsert",trainingPurchaseDto);
		
	}

	@Override
	public void purchaseDetailInsert(PurchaseDetailDto purchaseDetailDto) {
		
		sqlSession.insert("training_purchase.purchaseDetailInsert",purchaseDetailDto);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("training_purchase.sequence");
	}
	
	
	

}
