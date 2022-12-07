package com.kh.finalproject;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PetDto;



@SpringBootTest
public class MemberDetailTest {
	
	@Autowired
	private SqlSession sqlSession;

	
//	
//	@Test
//	public void test() {
//		String memberId="test1231";
//		MemberDto memberDto=sqlSession.selectOne("member.one",memberId);
//		System.out.println(memberDto);
//	}
//	
	
	


}
