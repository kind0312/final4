package com.kh.finalproject;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.ApplyDto;
import com.kh.finalproject.entity.MemberDto;

@SpringBootTest
public class MemberInsertTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {

		sqlSession.insert("member.insert", MemberDto.builder()
						.memberId("test4444")
						.memberPw("test4444!")
						.memberName("테스영")
						.memberEmail("test4444@naver.com")
						.memberTel("01044444444")
						.memberPost("444444")
						.memberBaseAddress("test주소입니다아")
						.memberDetailAddress("test상세주소입니다아")
						.memberBirth(Date.valueOf("2022-05-15"))
						.memberGender("남자")
				.build());
	}
	
	

	      
	}
	
	

