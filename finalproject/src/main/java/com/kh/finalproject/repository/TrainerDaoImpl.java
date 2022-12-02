package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.TrainerListVO;

@Repository
public class TrainerDaoImpl implements TrainerDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TrainerListVO> selectTrainerList() {

		return sqlSession.selectList("trainer.list");
	}
	
	@Override
	public List<TrainingDto> requestList(int trainerNo) {
		
		return sqlSession.selectList("training.trainingRequestList", trainerNo);
	}
}
