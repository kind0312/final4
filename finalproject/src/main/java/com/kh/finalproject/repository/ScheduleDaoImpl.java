package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ScheduleDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	private SqlSession sqlSession;
	
	//스케줄 등록
	@Override
	public void insert(ScheduleDto schduleDto) {
		sqlSession.insert("schedule.insert", schduleDto);
		
	}

	//스케줄 삭제
	@Override
	public boolean delete(int trainingNo) {
		return sqlSession.delete("schedule.delete",trainingNo)>0;
	}


}
