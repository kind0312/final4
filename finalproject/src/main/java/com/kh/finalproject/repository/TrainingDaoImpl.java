package com.kh.finalproject.repository;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;

import com.kh.finalproject.vo.PetDetailListVO;
import com.kh.finalproject.vo.ReservationDetailListVO;
import com.kh.finalproject.vo.OneTrainingVO;
import com.kh.finalproject.vo.ReservationListVO;
import com.kh.finalproject.vo.TrainingRequestListVO;


@Repository
public class TrainingDaoImpl implements TrainingDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean statusChange(int trainingNo) {
		return sqlSession.update("training.statusChange",trainingNo)>0;
	}
	
	//훈련서비스, 서비스상세, 회원 첨부파일 연결테이블 3개 조인 리스트
	@Override
	public List<OneTrainingVO> oneTraining(int trainingNo) {
		return sqlSession.selectList("training.oneTraining",trainingNo);
	}
	
	//훈련서비스 번호로 예약내역 조회
	@Override
	public TrainingDto selectOne(int trainingNo) {
		return sqlSession.selectOne("training.selectone",trainingNo);
	}
	
	//진행예약 조회(회원기준)
	@Override
	public List<TrainingDto> ingList(String memberId) {
		return sqlSession.selectList("training.ingList",memberId);
	}
	
	//지난예약 조회(회원기준)
	@Override
	public List<TrainingDto> endList(String memberId) {
		return sqlSession.selectList("training.endList",memberId);
	}
	
	//진행예약 조회(훈련사 기준)
	@Override
	public List<ReservationListVO> ingList(int trainerNo) {
		return sqlSession.selectList("training.reservationIngList",trainerNo);
	}
	//지난예약 조회(훈련사 기준)
	@Override
	public List<ReservationListVO> endList(int trainerNo) {
		return sqlSession.selectList("training.reservationEndList",trainerNo);
	}
	
	//예약 상세조회(훈련사 기준)
	@Override
	public List<ReservationDetailListVO> detailList(int trainingNo) {
		return sqlSession.selectList("training.reservationDetailList",trainingNo);
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

	@Override
	public void insert(TrainingDto dto) {
		 sqlSession.insert("training.insert",dto);
	}

	@Override
	public int sequence() {
		return sqlSession.selectOne("training.sequence");
	}

	@Override
	public void insertDetail(TrainingDetailDto dto) {
		sqlSession.insert("training.detailInsert", dto);
		
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

	@Override
	public List<TrainingRequestListVO> requestList(int trainerNo) {		
		return sqlSession.selectList("training.requestList", trainerNo);
	}

	@Override
	public List<TrainingDto> checkRequest(Date requestDate) {		
		return sqlSession.selectList("training.checkRequest", requestDate);
	}

	

	
	
}
