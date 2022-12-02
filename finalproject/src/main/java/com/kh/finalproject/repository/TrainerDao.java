package com.kh.finalproject.repository;


import java.util.List;

import com.kh.finalproject.entity.TrainingDto;
import com.kh.finalproject.vo.TrainerListVO;

public interface TrainerDao {


	List<TrainingDto> requestList(int trainerNo);

	//훈련사 목록보기 메소드
	List<TrainerListVO> selectTrainerList();

	
	

}
