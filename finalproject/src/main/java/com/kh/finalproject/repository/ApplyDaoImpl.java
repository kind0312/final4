package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ApplyDto;

@Repository
public class ApplyDaoImpl implements ApplyDao {

	@Autowired
	private SqlSession sqlSession;
	
	//시퀀스 생성
	@Override
	public int sequence() {
		return sqlSession.selectOne("apply.sequence");
	}
	
	//훈련사 등록
	@Override
	public void insert(ApplyDto applyDto) {
		int applyNo = sequence();
		applyDto.setApplyNo(applyNo);
		sqlSession.insert("apply.insert", applyDto);
	}
	
	@Override
	public ApplyDto selectone(String memberId) {
		return sqlSession.selectOne("apply.one", memberId);
	}
	
}
