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
	public int sequence() {
		return sqlSession.selectOne("point.sequence");
	}

	@Override
	public void insert(PointDto pointDto) {
		sqlSession.insert("point.insert",pointDto);
	}
	
	//예약 취소 후 포인트 insert
	@Override
	public void cancelInsert(PointDto pointDto) {
		sqlSession.insert("point.cancelInsert",pointDto);
	}

	@Override
	public List<PointDto> selectList(String memberId) {
		return sqlSession.selectList("point.list",memberId);
	}
	
	@Override
	public int count(String memberId) {
		return sqlSession.selectOne("point.count",memberId);
	}

	


}
