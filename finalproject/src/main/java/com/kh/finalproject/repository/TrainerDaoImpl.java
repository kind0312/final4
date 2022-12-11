package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListSearchVO;
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

	@Override
	public void insertTrainer(TrainerDto trainerDto) {
		sqlSession.insert("trainer.trainerProfileInsert", trainerDto);
		
	}

	@Override
	public TrainerListVO selectOne(String memberId) {
		
		return sqlSession.selectOne("trainer.selectOne", memberId);
		
	}

	@Override
	public List<ReviewVO> selectTrainerReview(int trainerNo) {
		return sqlSession.selectList("trainer.selectReviewOne", trainerNo);
	}

	@Override
	public List<TrainerListVO> selectList(TrainerListSearchVO vo) {
		
		if(vo.isSearch()) {
		    return sqlSession.selectList("trainer.search",vo);
		}
		else {
			return sqlSession.selectList("trainer.list",vo);
		}
		
	}

	public TrainerDto selectOnePro(String memberId) {		
		return sqlSession.selectOne("trainer.selectOnePro", memberId);
	}

	


	@Override
	public boolean updateTrainer(TrainerDto trainerDto) {		
		int count =sqlSession.update("trainer.trainerProfileUpdate", trainerDto);
		return count > 0;
	}

	@Override
	public int selectOneTrainerNo(String memberId) {		
		return sqlSession.selectOne("trainer.selectOneTrainerNo", memberId);
	}


	
	
}
