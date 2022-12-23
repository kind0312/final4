package com.kh.finalproject;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.TrainingDto;

@SpringBootTest
public class RequestListTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		//파라미터 int로 숫자를 받는 단일 조회
		int trainerNo = 1;
		TrainingDto dto = sqlSession.selectOne("training.trainingRequestList", trainerNo);
	}
}
