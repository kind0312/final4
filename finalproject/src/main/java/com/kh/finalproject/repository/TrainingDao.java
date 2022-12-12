package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.OneTrainingVO;
import com.kh.finalproject.vo.ReservationIngListVO;

public interface TrainingDao {
	//등록
	
	//수정
	//상태(예약취소) 변경
	boolean statusChange(int trainingNo);
	
	//테이블 조인 후 예약내역 조회
	List<OneTrainingVO> oneTraining(int trainingNo);
	//훈련서비스 번호로 예약내역 조회
	TrainingDto selectOne(int trainingNo);
	//진행예약 조회(회원 기준)
	List<TrainingDto> ingList(String memberId);
	//지난예약 조회(회원 기준)
	List<TrainingDto> endList(String memberId);
	//진행예약 조회(훈련사 기준)
	List<ReservationIngListVO> ingList(int trainerNo);
	//진난예약 조회(훈련사 기준)
	//훈련서비스 받은 펫 마리 수 조회
	int petCount(int trainingNo);
	//훈련서비스 받은 펫 조회
	List<TrainingDetailDto> trainingPet(int trainingNo);
	
	//예약 서비스
	void insert(TrainingDto dto);
	
	//시퀀스 추출
	int sequence();
	
	//펫 상세 등록 
	void insertDetail(TrainingDetailDto dto);
	
	//삭제
	boolean delete(int trainingNo);
	
}
