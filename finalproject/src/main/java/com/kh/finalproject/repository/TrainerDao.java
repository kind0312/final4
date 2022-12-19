package com.kh.finalproject.repository;


import java.util.List;

import com.kh.finalproject.entity.TrainerDto;
import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.ReviewVO;
import com.kh.finalproject.vo.TrainerListSearchVO;
import com.kh.finalproject.vo.TrainerListVO;
import com.kh.finalproject.vo.TrainerOneVO;


public interface TrainerDao {

	//훈련사 예약요청목록 메소드
	List<TrainingDto> requestList(int trainerNo);

	//훈련사 목록보기 메소드
	List<TrainerListVO> selectTrainerList();
	
	//훈련사 디테일 메소드
	TrainerListVO selectOne(int trainerNo);
	
	//훈련사 리뷰 메소드
	List<ReviewVO> selectTrainerReview(int trainerNo);
	
	//훈련사 리뷰 메소드 평점 낮은순
    List<ReviewVO> selectTrainerReviewBad(int trainerNo);

	//훈련사테이블(자기소개) insert 메소드
	void insertTrainer(TrainerDto trainerDto);
	
	//훈련사 한 명 단일 조회(변수:회원ID)
	TrainerDto selectOnePro(String memberId);
	//훈련사 한 명 단일 조회(변수:훈련사번호)
	TrainerOneVO selectOnePro(int trainingNo);
	
	//훈련사테이블(자기소개) update 수정 메소드
	boolean updateTrainer(TrainerDto trainerDto);
	
	//관리자 훈련사 목록 조회
	List<TrainerListVO>selectList(TrainerListSearchVO vo);

	
	//트레이너 아이디로 trainer 테이블에서 trainerNo 찾기
	int selectOneTrainerNo(String memberId);
	
	//트레이너 번호로 트레이너 아이디 찾기
	String selectOneTrainerId(int trainerNo);

    //훈련사 디데일 메소드(어아디)
	TrainerListVO selectOne(String memberId);
	
	//시퀀스 생성
	int sequence();
	
	//훈련사 생성
	void insert(TrainerDto dto);
	
	
	//후기순 정렬
	List<TrainerListVO> selectTrainerListAvg();
	
	//홈화면 트레이너 정렬(후기개수 기준)
	List<TrainerListVO> mainTrainerList();

}
