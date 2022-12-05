package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainingDto;

@Repository
public class TrainingDaoImpl implements TrainingDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TrainingDto> ingList(String memberId) {
		return sqlSession.selectList("training.ingList",memberId);
	}

	@Override
	public List<TrainingDto> endList(String memberId) {
		return sqlSession.selectList("training.endList",memberId);
	}
	
}
