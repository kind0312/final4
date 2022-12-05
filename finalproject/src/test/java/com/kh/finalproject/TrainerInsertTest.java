package com.kh.finalproject;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.TrainerDto;

@SpringBootTest
public class TrainerInsertTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		
		TrainerDto trainerDto = TrainerDto.builder()
				.trainerNo(13)
				.memberId("test7878")
				.applyNo(17)
				.trainerProfile("제목")
				.trainerProfileContent("내용")
				.build();
		
		 sqlSession.insert("trainer.trainerProfileInsert", trainerDto);
	}
	
}
