package com.kh.finalproject;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class FindIdTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void findid() {
		MemberDto memberDto = MemberDto.builder().memberName("딱충이").memberTel("01099998888").build();
		MemberDto findId = sqlSession.selectOne("member.findId", memberDto.getMemberName());
		boolean find = memberDto.getMemberTel().equals(findId.getMemberTel());
		log.debug("findId = {}" , findId.getMemberTel());
		log.debug("inputId = {}" , memberDto.getMemberTel());
		log.debug("find = {}", find);
	}
}
