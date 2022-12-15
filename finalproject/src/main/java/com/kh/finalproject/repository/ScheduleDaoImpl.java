package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ScheduleDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ScheduleDto schduleDto) {
		sqlSession.insert("schedule.insert", schduleDto);
		
	}

}
