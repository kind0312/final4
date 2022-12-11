package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.PetDetailListVO;

@Repository
public class TrainingDaoImpl implements TrainingDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean statusChange(int trainingNo) {
		return sqlSession.update("training.statusChange",trainingNo)>0;
	}
	
	//훈련서비스 번호로 예약내역 조회
	@Override
	public TrainingDto selectOne(int trainingNo) {
		return sqlSession.selectOne("training.selectone",trainingNo);
	}
	
	//진행예약 조회
	@Override
	public List<TrainingDto> ingList(String memberId) {
		return sqlSession.selectList("training.ingList",memberId);
	}
	
	//지난예약 조회
	@Override
	public List<TrainingDto> endList(String memberId) {
		return sqlSession.selectList("training.endList",memberId);
	}
	
	//훈련서비스 받은 펫 마리 수 조회
	@Override
	public int petCount(int trainingNo) {
		return sqlSession.selectOne("training.petCount",trainingNo);
	}

	//훈련서비스 받은 펫 조회
	@Override
	public List<TrainingDetailDto> trainingPet(int trainingNo) {
		return sqlSession.selectList("training.petList",trainingNo);
	}
	
	//훈련서비스 삭제
	@Override
	public boolean delete(int trainingNo) {
		return sqlSession.delete("training.delete",trainingNo)>0;
	}
	
	//훈련상태변경- 예약확정
	@Override
	public boolean statusChange2(int trainingNo) {		
		return sqlSession.update("training.statusChange2",trainingNo)>0;
	}
	
	//훈련사 request_detail 펫 리스트 조회
	@Override
	public List<PetDetailListVO> requestDetail(int trainingNo) {		
		return sqlSession.selectList("training.requestDetailPetList", trainingNo);
	}
	
}
