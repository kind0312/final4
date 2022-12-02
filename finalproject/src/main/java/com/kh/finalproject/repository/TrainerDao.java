package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.TrainingDto;

public interface TrainerDao {

	List<TrainingDto> requestList(int trainerNo);
}
