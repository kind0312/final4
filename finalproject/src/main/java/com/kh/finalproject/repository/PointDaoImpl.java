package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointDto;

@Repository
public class PointDaoImpl implements PointDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(PointDto pointDto) {
		sqlSession.insert("point.insert",pointDto);
	}

	@Override
	public List<PointDto> selectList(String memberId) {
		return sqlSession.selectList("point.list",memberId);
	}
	
	
	

}
