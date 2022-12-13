package com.kh.finalproject.repository;

import java.sql.Date;
import java.util.List;

import com.kh.finalproject.entity.TrainingDetailDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.CalendarVO;
import com.kh.finalproject.vo.OneTrainingVO;
import com.kh.finalproject.vo.PetDetailListVO;
import com.kh.finalproject.vo.ReservationDetailListVO;
import com.kh.finalproject.vo.ReservationListVO;
import com.kh.finalproject.vo.ScheduleVO;
import com.kh.finalproject.vo.TrainingRequestListVO;


public interface TrainingDao {
	//등록
	
	//수정
	//상태(예약취소) 변경
	boolean statusChange(int trainingNo);
	//상태(예약확정) 변경
	boolean statusChange2(int trainingNo);
	//상태(이용완료) 변경
	boolean statusChange3(int trainingNo);
	
	
	//테이블 조인 후 예약내역 조회
	List<OneTrainingVO> oneTraining(int trainingNo);
	//훈련서비스 번호로 예약내역 조회
	TrainingDto selectOne(int trainingNo);
	//진행예약 조회(회원 기준)
	List<TrainingDto> ingList(String memberId);
	//지난예약 조회(회원 기준)
	List<TrainingDto> endList(String memberId);
	//진행예약 조회(훈련사 기준)
	List<ReservationListVO> ingList(int trainerNo);
	//진난예약 조회(훈련사 기준)
	List<ReservationListVO> endList(int trainerNo);
	//예약 상세조회(훈련사 기준)
	List<ReservationDetailListVO> detailList(int trainingNo);
	//스케줄 날짜 클릭 후 예약내역 조회
	List<ReservationListVO> schedule(ScheduleVO scheduleVO);
	//DB에 있는 데이터 스케줄에 미리 표시하기 위한 조회
	List<CalendarVO> scheduleDataList(int trainerNo);
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
	
	//request_training 디테일 내역
	List<PetDetailListVO> requestDetail(int trainerNo);
	
	//request_training list
	List<TrainingRequestListVO> requestList(int trainerNo);
	
	//훈련요청날짜에 확정된 요청이 있는지
	List<TrainingDto> checkRequest(Date requestDate);
	
}
