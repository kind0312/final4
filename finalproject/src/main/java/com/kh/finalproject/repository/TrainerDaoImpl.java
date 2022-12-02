package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainingDto;

@Repository
public class TrainerDaoImpl implements TrainerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TrainingDto> requestList(int trainerNo) {
		
		return sqlSession.selectList("training.trainingRequestList", trainerNo);
	}

}
