package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ApplyDto;



@Repository
public class ApplyDaoImpl implements ApplyDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<ApplyDto> selectList() {
		
		return sqlSession.selectList("apply.list");
	}


	@Override
	public ApplyDto selectOne(int applyNo) {
		return sqlSession.selectOne("apply.one",applyNo);
	}


	@Override
	public boolean update(ApplyDto dto) {
		int count= sqlSession.update("apply.approval",dto);
		return count>0;
	}


	@Override
	public boolean update2(ApplyDto dto) {
		int count=sqlSession.update("apply.reject",dto);
		return count>0;
	
	}



//	@Override
//	public ApplyDto update(int applyNo) {
//		return sqlSession.update("apply.approval",applyNo);
//	
//	}
	      
	}
