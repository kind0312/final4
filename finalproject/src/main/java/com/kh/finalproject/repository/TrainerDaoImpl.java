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
import com.kh.finalproject.vo.TrainerOneVO;


@Repository
public class TrainerDaoImpl implements TrainerDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TrainerListVO> selectTrainerList() {

		return sqlSession.selectList("trainer.list");
	}
	
	@Override
	public List<TrainerListVO> selectTrainerListAvg() {

		return sqlSession.selectList("trainer.listAvg");
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
	public TrainerListVO selectOne(int trainerNo) {
		
		return sqlSession.selectOne("trainer.selectOne", trainerNo);
		
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

	//훈련사 한 명 단일 조회(변수:회원ID)
	public TrainerDto selectOnePro(String memberId) {		
		return sqlSession.selectOne("trainer.selectOnePro", memberId);
	}
	//훈련사 한 명 단일 조회(변수:훈련사번호)
	@Override
	public TrainerOneVO selectOnePro(int trainingNo) {
		return sqlSession.selectOne("trainer.selectOneProNo", trainingNo);
	}

	//프로필 업데이트
	@Override
	public boolean updateTrainer(TrainerDto trainerDto) {		
		int count =sqlSession.update("trainer.trainerProfileUpdate", trainerDto);
		return count > 0;
	}

	@Override
	public int selectOneTrainerNo(String memberId) {		
		return sqlSession.selectOne("trainer.selectOneTrainerNo", memberId);
	}

	@Override
	public String selectOneTrainerId(int trainerNo) {		
		return sqlSession.selectOne("trainer.selectOneTrainerId", trainerNo);
	}

	@Override
	public TrainerListVO selectOne(String memberId) {

		return sqlSession.selectOne("trainer.selectOneId",memberId);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("trainer.sequence");
	}

	@Override
	public void insert(TrainerDto dto) {
		sqlSession.insert("trainer.insert",dto);
		
	}

	@Override
	public List<ReviewVO> selectTrainerReviewBad(int trainerNo) {
		
		 return sqlSession.selectList("trainer.selectReviewOneBad", trainerNo);
	}
	
	@Override
	public List<ReviewVO> selectTrainerReview(int trainerNo) {
		return sqlSession.selectList("trainer.selectReviewOne", trainerNo);
	}
	

	//홈화면 트레이너 정렬(후기개수 기준)
	@Override
	public List<TrainerListVO> mainTrainerList() {
		return sqlSession.selectList("trainer.mainTrainerList");
	}


	
	
}
