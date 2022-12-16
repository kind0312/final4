package com.kh.finalproject.repository;

import com.kh.finalproject.entity.ScheduleDto;

public interface ScheduleDao {
	
	//등록
	void insert(ScheduleDto schduleDto);
	//삭제
	boolean delete(int trainingNo);
}
