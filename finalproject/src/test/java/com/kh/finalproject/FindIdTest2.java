package com.kh.finalproject;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class FindIdTest2 {

	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void findid() {
		MemberDto memberDto = MemberDto.builder().memberName("뽀로로").build();
//		MemberDto findId = memberDao.find(memberDto);
//		log.debug("findId = {}" , findId.getMemberId());
//		log.debug("findId = {}" , findId);
		log.debug("id = {}", memberDao.find(memberDto).getMemberId());
		
	}
}
