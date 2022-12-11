package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.PetDetailListVO;

public interface TrainingDao {
	//등록
	
	//수정
	//상태(예약취소) 변경
	boolean statusChange(int trainingNo);
	//상태(예약확정) 변경
	boolean statusChange2(int trainingNo);
	
	
	//훈련서비스 번호로 예약내역 조회
	TrainingDto selectOne(int trainingNo);
	//진행예약 조회
	List<TrainingDto> ingList(String memberId);
	//지난예약 조회
	List<TrainingDto> endList(String memberId);
	//훈련서비스 받은 펫 마리 수 조회
	int petCount(int trainingNo);
	//훈련서비스 받은 펫 조회
	List<TrainingDetailDto> trainingPet(int trainingNo);
	
	//삭제
	boolean delete(int trainingNo);
	
	//request_training 디테일 내역
	List<PetDetailListVO> requestDetail(int trainerNo);
	
}
