package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointPurchaseDto;

@Repository
public class PointPurchaseDaoImpl implements PointPurchaseDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int sequence() {
		return sqlSession.selectOne("point_purchase.sequence");
	}

	@Override
	public void insert(PointPurchaseDto pointPurchaseDto) {
		sqlSession.insert("point_purchase.insert", pointPurchaseDto);
	}


}
