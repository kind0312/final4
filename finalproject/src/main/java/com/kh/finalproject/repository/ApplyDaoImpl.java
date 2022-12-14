package com.kh.finalproject.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ApplyDto;
import com.kh.finalproject.vo.ApplyDetailVO;
import com.kh.finalproject.vo.ApplyListSearchVO;



@Repository
public class ApplyDaoImpl implements ApplyDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ApplyDto> selectList(ApplyListSearchVO vo) {
		
		return sqlSession.selectList("apply.list",vo);
	}

	@Override
	public ApplyDto selectOne(int applyNo) {
		return sqlSession.selectOne("apply.one",applyNo);
	}

	//지원자 상세(ApplyDetailVO로 반환)
	@Override
	public ApplyDetailVO detailOne(int applyNo) {
		return sqlSession.selectOne("apply.applyDetail",applyNo);
	}

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


	@Override
	public boolean status1(String memberId) {
		return sqlSession.update("apply.approval",memberId)>0;
	}


	@Override
	public boolean status2(String memberId) {
		return sqlSession.update("apply.reject",memberId)>0;
	}
	



	
}

